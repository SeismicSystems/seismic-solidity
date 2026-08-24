$ErrorActionPreference = "Stop"

cd "$PSScriptRoot\.."

if ("$Env:FORCE_RELEASE" -Or "$Env:CIRCLE_TAG") {
    New-Item prerelease.txt -type file
    Write-Host "Building release version."
} else {
    $last_commit_timestamp = git log -1 --date=unix --format=%cd HEAD
    $last_commit_date = (Get-Date -Date "1970-01-01 00:00:00Z").ToUniversalTime().AddSeconds($last_commit_timestamp).ToString("yyyy.M.d")
    -join("ci.", $last_commit_date) | Out-File -Encoding ascii prerelease.txt
}

mkdir build
cd build

$boost_dir = Resolve-Path "$PSScriptRoot\..\deps\boost\lib\cmake\Boost-*"
Write-Host "Using Boost Directory: $boost_dir"

..\deps\cmake\bin\cmake -G "Visual Studio 17 2022" `
    -A x64 `
    -DBoost_DIR="$boost_dir\" `
    -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded `
    -DCMAKE_INSTALL_PREFIX="$PSScriptRoot\..\upload" ..

if (-not $?) { throw "CMake configure failed." }

# Dynamically locate msbuild using vswhere
$msbuildPath = & "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" `
    -latest `
    -products * `
    -requires Microsoft.Component.MSBuild `
    -find MSBuild\**\Bin\MSBuild.exe

if (-not (Test-Path $msbuildPath)) {
    throw "msbuild not found. Ensure Visual Studio Build Tools are installed with MSBuild."
}

Write-Host "Using msbuild at: $msbuildPath"

& $msbuildPath solidity.sln /p:Configuration=Release /m:10 /v:minimal
if (-not $?) { throw "Build failed." }

..\deps\cmake\bin\cmake --build . -j 10 --target install --config Release
if (-not $?) { throw "Install target failed." }

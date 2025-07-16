pragma solidity >=0.0;
// SPDX-License-Identifier: MIT
contract C {
    sbytes private sbData;
    sstring private ssData;
    
    function setSbytes(sbytes memory _data) public {
        sbData = _data;
    }
    
    function getSbytes() internal view returns (sbytes memory) {
        return sbData;
    }
    
    function setSstring(sstring memory _data) public {
        ssData = _data;
    }
    
    function getSstring() internal view returns (sstring memory) {
        return ssData;
    }
}
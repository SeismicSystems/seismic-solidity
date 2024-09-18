import os
import shutil

def duplicate_and_replace(file_paths):
    for file_path in file_paths:
        # Get the directory and filename
        file_path = "test/libsolidity/syntaxTests/literalOperations/" + file_path
        directory, filename = os.path.split(file_path)
        
        # Create the new filename
        new_filename = f"shielded_{filename}"
        
        # Create the full path for the new file
        new_file_path = os.path.join(directory, new_filename)
        
        # Copy the original file
        shutil.copy2(file_path, new_file_path)
        
        # Read the content of the new file
        with open(new_file_path, 'r') as file:
            content = file.read()

        # Replace all instances of "int" with "sint"
        modified_content = content.replace("int", "sint")

        # Replace all instances of "uint" with "suint". Note all "uint" instances will be "usint" after the line above
        modified_content = modified_content.replace("usint", "suint")
       
        # Write the modified content back to the new file
        with open(new_file_path, 'w') as file:
            file.write(modified_content)
        
        print(f"Created modified file: {new_file_path}")

# Example usage
solidity_files = [
    "division_by_zero.sol",
    "division_by_zero_complex.sol",
    "division_by_zero_complex_compound.sol",
    "division_by_zero_compound.sol",
    "division_by_zero_nonliteral.sol",
    "exponent.sol",
    "exponent_fine.sol",
    "mod_zero.sol",
    "mod_zero_complex.sol",
    "mod_zero_compound.sol",
    "mod_zero_complex_compound.sol",
    "mod_zero_nonliteral.sol"
]
duplicate_and_replace(solidity_files)
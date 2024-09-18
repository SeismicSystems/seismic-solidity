import os
import shutil

def duplicate_and_replace(file_paths):
    for file_path in file_paths:
        # Get the directory and filename
        file_path = "test/libsolidity/syntaxTests/types/" + file_path
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

        # Replace all instances of "int" with "sint"
        modified_content = modified_content.replace("usint", "suint")
       
        # Write the modified content back to the new file
        with open(new_file_path, 'w') as file:
            file.write(modified_content)
        
        print(f"Created modified file: {new_file_path}")

# Example usage
solidity_files = [
    "rational_negative_numerator_negative_exp.sol",
    "rational_number_array_index_limit.sol",
    "rational_number_bitshift_limit.sol",
    "rational_number_div_limit.sol",
    "rational_number_exp_limit_fail.sol",
    "rational_number_exp_limit_fine.sol",
    "rational_number_huge.sol",
    "rational_number_huge_fail.sol",
    "rational_number_literal_limit_1.sol",
    "rational_number_literal_limit_2.sol",
    "rational_number_literal_limit_3.sol",
    "rational_number_literal_to_fixed_implicit.sol",
    "rational_number_mul_limit.sol",
    "rational_number_signed_to_unsigned.sol",
    "rational_number_too_large.sol"
]
duplicate_and_replace(solidity_files)
import os
import shutil

# def duplicate_and_replace(file_paths):
#     for file_path in file_paths:
#         # Get the directory and filename
#         file_path = "test/libsolidity/syntaxTests/parsing/" + file_path + ".sol"
#         directory, filename = os.path.split(file_path)
        
#         # Create the new filename
#         new_filename = f"shielded_{filename}"
        
#         # Create the full path for the new file
#         new_file_path = os.path.join(directory, new_filename)
        
#         # Copy the original file
#         shutil.copy2(file_path, new_file_path)
        
#         # Read the content of the new file
#         with open(new_file_path, 'r') as file:
#             content = file.read()
#         # Replace all instances of "address" with "saddress"
#         modified_content = content.replace("address", "saddress")
       
#         # Write the modified content back to the new file
#         with open(new_file_path, 'w') as file:
#             file.write(modified_content)
        
#         print(f"Created modified file: {new_file_path}")
# # Example usage
# solidity_files = [
#     "address_constant_payable",
#     "address_function_arguments_and_returns",
#     "address_in_struct",
#     "address_invalid_state_mutability",
#     "address_nonpayable",
#     "address_payable",
#     "address_payable_constant",
#     "address_payable_function_type",
#     "address_payable_library",
#     "address_payable_local",
#     "address_payable_state_variable",
#     "address_payable_struct",
#     "address_payable_type_expression",
#     "address_public_payable_error"
# ]
# duplicate_and_replace(solidity_files)

def duplicate_and_replace(directory):
    # Walk through the directory
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith('.sol'):
                file_path = os.path.join(root, filename)
                
                # Create the new filename
                new_filename = f"shielded_{filename}"
                
                # Create the full path for the new file
                new_file_path = os.path.join(root, new_filename)
                
                # Copy the original file
                shutil.copy2(file_path, new_file_path)
                
                # Read the content of the new file
                with open(new_file_path, 'r') as file:
                    content = file.read()
                
                # Replace all instances of "address" with "saddress"
                modified_content = content.replace("address", "saddress")
                
                # Write the modified content back to the new file
                with open(new_file_path, 'w') as file:
                    file.write(modified_content)
                
                print(f"Created modified file: {new_file_path}")

# Directory to process
directory_to_process = "test/libsolidity/syntaxTests/types/address"

# Call the function
duplicate_and_replace(directory_to_process)
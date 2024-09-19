import os
import shutil

def duplicate_and_replace(file_paths):
    for file_path in file_paths:
        # Get the directory and filename
        file_path = "test/libsolidity/syntaxTests/nameAndTypeResolution/" + file_path
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
    "010_type_conversion_for_comparison.sol",
    "011_type_conversion_for_comparison_invalid.sol",
    "019_comparison_bitop_precedence.sol",
    "105_constant_input_parameter.sol",
    "164_assigning_value_to_const_variable.sol",
    # "165_assigning_value_to_const_variable.sol",
    # "167_constant_string_literal_dis"
    "113_exp_warn_literal_base_1.sol",
    "114_exp_warn_literal_base_2.sol",
    "115_exp_warn_literal_base_3.sol",
    "116_shift_warn_literal_base_1.sol",
    "117_shift_warn_literal_base_2.sol",
    "118_shift_warn_literal_base_3.sol",
    "119_shift_warn_literal_base_4.sol",
    "128_enum_explicit_conversion_is_okay.sol",
    "129_int_to_enum_explicit_conversion_is_okay.sol",
    "130_enum_implicit_conversion_is_not_okay_256.sol",
    "131_enum_implicit_conversion_is_not_okay_64.sol",
    "152_array_copy_with_different_types1.sol",
    "153_array_copy_with_different_types2.sol",
    "154_array_copy_with_different_types_conversion_possible.sol",
    "155_array_copy_with_different_types_static_dynamic.sol",
    "156_array_copy_with_different_types_dynamic_static.sol",
    "190_negative_integers_to_signed_out_of_bound.sol",
    "191_negative_integers_to_signed_min.sol",
    "192_positive_integers_to_signed_out_of_bound.sol",
    "193_positive_integers_to_signed_out_of_bound_max.sol",
    "194_negative_integers_to_unsigned.sol",
    "195_positive_integers_to_unsigned_out_of_bound.sol",
    "196_integer_boolean_or.sol",
    "197_integer_boolean_and.sol",
    "198_integer_boolean_not.sol",
    "199_integer_unsigned_exp_signed.sol",
    "200_integer_signed_exp_unsigned.sol",
    "201_integer_signed_exp_signed.sol",
    "288_conditional_with_all_types.sol",
    "327_rational_index_access.sol",
    "328_rational_to_fixed_literal_expression.sol",
    "329_rational_as_exponent_value_signed.sol",
    "330_rational_as_exponent_value_unsigned.sol",

]
duplicate_and_replace(solidity_files)
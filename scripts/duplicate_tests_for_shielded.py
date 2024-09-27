import os
import shutil

def duplicate_and_replace():
    for root, dirs, files in os.walk('.'):
        for file in files:
            if 'shielded' in file:
                file_path = os.path.join(root, file)
   
                # Check if the file contains "int"
                with open(file_path, 'r') as f:
                    content = f.read()
                    if "int" not in content:
                        os.remove(file_path)
                        print(f"Deleted file: {file_path}")
                        continue

                # If the file contains "int", process it here
                # (Add your processing logic)
        


# Example usage

duplicate_and_replace()
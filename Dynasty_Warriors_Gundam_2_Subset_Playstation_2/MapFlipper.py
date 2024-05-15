import os
from PIL import Image

def flip_images_in_directory(directory, output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    # Scan the directory for relevant image files
    for filename in os.listdir(directory):
        if filename.endswith("_Downhill.png") or filename.endswith("_Uphill.png"):
            # Construct full file path
            file_path = os.path.join(directory, filename)
            
            # Open the image
            with Image.open(file_path) as img:
                # Rotate the image 180 degrees
                flipped_img = img.rotate(180)

                # Determine new filename with the opposite suffix
                if "_Downhill.png" in filename:
                    new_filename = filename.replace("_Downhill.png", "_Uphill.png")
                else:
                    new_filename = filename.replace("_Uphill.png", "_Downhill.png")

                # Construct full path for the new file
                new_file_path = os.path.join(output_dir, new_filename)

                # Save the flipped image with the new name
                flipped_img.save(new_file_path)
                print(f"Processed and saved: {new_file_path}")

# Example usage:
directory_path = 'Generated' 
output_dir = 'Flipped' 
flip_images_in_directory(directory_path, output_dir)
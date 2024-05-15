from PIL import Image
import os

# Create the 'Generated' directory if it doesn't exist
os.makedirs('Generated', exist_ok=True)

# Path to the 'Characters' directory
input_directory = 'Suits'
output_directory = 'Generated'

# Iterate over each file in the 'Characters' directory
for filename in os.listdir(input_directory):
    if filename.endswith('.png'):  # Check for PNG images
        # Construct the full file path
        file_path = os.path.join(input_directory, filename)
        
        # Open the image
        with Image.open(file_path) as img:
            # Convert the image to have an alpha channel if it doesn't have one
            if img.mode != 'RGBA':
                img = img.convert('RGBA')
            
            # Access the pixel data
            pixels = img.load()
            
            # Modify the alpha channel for each pixel
            for i in range(img.width):
                for j in range(img.height):
                    r, g, b, a = pixels[i, j]
                    if a > 0:
                        pixels[i, j] = (r, g, b, 255)
            
            # Resize the image to 64x64 using LANCZOS
            img_resized = img.resize((64, 64), Image.LANCZOS)
            
            # Save the modified image
            output_path = os.path.join(output_directory, filename)
            img_resized.save(output_path)

print("Image processing completed.")

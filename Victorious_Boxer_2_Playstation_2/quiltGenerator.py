from PIL import Image
import os
import math
import sys
# Check if the correct number of arguments is provided
if len(sys.argv) != 3:
    print("Usage: python quiltGenerator.py <input_dir> <output_filename>")
    sys.exit(1)

# Get the input directory and output filename from the command line arguments
input_dir = sys.argv[1]
output_filename = sys.argv[2]
# Directory containing the images you want to combine
# input_dir = "Output"

# Output directory where the quilt will be saved
output_dir = "quilt"

# Get a list of image files in the input directory
image_files = [f for f in os.listdir(input_dir) if f.endswith(('.png', '.jpg', '.jpeg', '.gif'))]

# Calculate the number of rows based on the number of images
num_images = len(image_files)
num_columns = min(math.ceil(num_images / 10), 10)  # Maximum of 10 columns

# Square width and height
square_size = 64

# Calculate the number of columns based on the number of images and rows
num_rows = math.ceil(num_images / num_columns)

# Create a blank canvas for the quilt
quilt_width = num_columns * square_size
quilt_height = num_rows * square_size
quilt = Image.new("RGB", (quilt_width, quilt_height), (255, 255, 255))

# Iterate through the images in the input directory
for i, image_filename in enumerate(image_files):
    if i >= num_columns * num_rows:
        break  # Limit the number of images in the quilt

    image_path = os.path.join(input_dir, image_filename)
    image = Image.open(image_path)

    # Resize the image to the square size using the ANTIALIAS filter method
    image = image.resize((square_size, square_size), Image.LANCZOS)

    # Calculate the position to paste the image in the quilt
    x = (i % num_columns) * square_size
    y = (i // num_columns) * square_size

    # Paste the resized image onto the quilt
    quilt.paste(image, (x, y))

# Save the quilt
# Ensure the output filename has a .png extension if it doesn't already
if not output_filename.lower().endswith('.png'):
    output_filename += '.png'

# Save the quilt
quilt.save(os.path.join(output_dir, output_filename))
print (f"Input Directory: {input_dir}")
print (f"Output Filename: {output_filename}")

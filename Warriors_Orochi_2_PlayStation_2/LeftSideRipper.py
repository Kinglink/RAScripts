import os
from PIL import Image

def process_and_resize_images(input_dir, output_dir, new_size=(64, 64)):
    # Ensure the output directory exists
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    # Iterate over all files in the input directory
    for filename in os.listdir(input_dir):
        file_path = os.path.join(input_dir, filename)
        
        # Skip directories and non-image files
        if os.path.isdir(file_path) or not file_path.lower().endswith(('.png', '.jpg', '.jpeg')):
            continue
        
        # Load the image and convert to RGBA
        image = Image.open(file_path).convert('RGBA')
        width, height = image.size
        
        # Define the coordinates for the square region on the far right side
        new_right = height
        
        # Crop the image to get the square region
        clipped_image = image.crop((0, 0, new_right, height))
        
        # Extract the channels from the cropped region
        r, g, b, a = clipped_image.split()
        
        # Create a new alpha channel that is fully opaque
        new_alpha = Image.new('L', clipped_image.size, 255)
        
        # Merge the channels back together
        final_image_with_alpha = Image.merge('RGBA', (r, g, b, new_alpha))
        
        # Resize the image to the specified new size
        resized_image = final_image_with_alpha.resize(new_size, Image.LANCZOS)
        
        # Save the modified and resized image in the output directory
        new_filename = filename.split('.')[0] + '_left.' + filename.split('.')[1]
        resized_image.save(os.path.join(output_dir, new_filename))

# Specify the input directory and output directory paths
input_dir = 'GalleryImages'
output_dir = 'output'

# Process all images in the input directory
process_and_resize_images(input_dir, output_dir)

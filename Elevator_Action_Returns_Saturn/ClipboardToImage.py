#!/usr/bin/env python3

import os
import io
from PIL import Image, ImageGrab

def crop_center(img, crop_width, crop_height):
    img_width, img_height = img.size
    return img.crop(((img_width - crop_width) // 2,
                     (img_height - crop_height) // 2,
                     (img_width + crop_width) // 2,
                     (img_height + crop_height) // 2))

def resize_image(file_name):
    # Get image from clipboard
    image_data = ImageGrab.grabclipboard()
    image = image_data

    # Determine the size for cropping
    min_dimension = min(image.size)
    image = crop_center(image, min_dimension, min_dimension)

    # Resize to 64x64
    image = image.resize((64, 64))

    # Create the rips folder if it doesn't exist
    if not os.path.exists('Generated'):
        os.makedirs('Generated')

    # Save the image in the rips folder with the user-provided name
    output_path = os.path.join('Generated', f'{file_name}.png')
    image.save(output_path)
    print(f"Image saved as {output_path}")

if __name__ == "__main__":
    file_name = input("Enter a name for the image file: ")
    resize_image(file_name)

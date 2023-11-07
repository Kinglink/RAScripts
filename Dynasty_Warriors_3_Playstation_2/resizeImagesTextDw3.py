from PIL import Image
import os

input_dir = "Ripped\\Text"
output_dir = "Generated\\Text"
canvas_size = (64, 64)

def resize_and_position(input_image_path, output_image_path):
    # Open the image
    img = Image.open(input_image_path)

    # Resize while maintaining aspect ratio
    img.thumbnail(canvas_size)

    # Iterate through pixels and set alpha to 255 for any pixel with alpha > 0
    pixels = img.load()
    for y in range(img.height):
        for x in range(img.width):
            r, g, b, a = pixels[x, y]
            if a > 0:
                pixels[x, y] = (r, g, b, 255)

    # Save the modified image
    img.save(output_image_path)

for filename in os.listdir(input_dir):
    if filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
        input_image_path = os.path.join(input_dir, filename)
        output_image_path = os.path.join(output_dir, filename)

        resize_and_position(input_image_path, output_image_path)
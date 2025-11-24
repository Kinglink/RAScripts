from PIL import Image
import os

input_dir = "Ripped"
output_dir = "Output"

def process_image(input_image_path, output_image_path):
    # Open the image
    img = Image.open(input_image_path).convert("RGBA")

    # Create a copy so we can safely edit
    new_img = Image.new("RGBA", img.size, (255, 255, 255, 0))
    new_img.paste(img, (0, 0))

    # Iterate through pixels and set alpha to 255 for any pixel with alpha > 0
    pixels = new_img.load()
    for y in range(new_img.height):
        for x in range(new_img.width):
            r, g, b, a = pixels[x, y]
            if a > 0:
                pixels[x, y] = (r, g, b, 255)

    # Save the modified image
    new_img.save(output_image_path)

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

for filename in os.listdir(input_dir):
    if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Case-insensitive check
        input_image_path = os.path.join(input_dir, filename)

        # Replace spaces with underscores in the output filename
        safe_filename = filename.replace(" ", "_")

        output_image_path = os.path.join(output_dir, safe_filename)
        process_image(input_image_path, output_image_path)

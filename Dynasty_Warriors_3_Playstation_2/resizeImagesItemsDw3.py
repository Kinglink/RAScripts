from PIL import Image
import os

input_dir = "Ripped\\Items"
output_dir = "Generated\\Items"
canvas_size = (64, 64)

def resize_and_position(input_image_path, output_image_path):
    # Open the image
    img = Image.open(input_image_path)

    # Resize while maintaining aspect ratio
    img.thumbnail(canvas_size)

    # Create a new canvas
    new_img = Image.new("RGBA", canvas_size, (255, 255, 255, 0))

    # Calculate the position to place the image in the middle of the canvas
    x = (canvas_size[0] - img.width) // 2
    y = (canvas_size[1] - img.height) // 2

    # Paste the resized image onto the canvas at the calculated position
    new_img.paste(img, (x, y))

    # Iterate through pixels and set alpha to 255 for any pixel with alpha > 0
    pixels = new_img.load()
    for y in range(new_img.height):
        for x in range(new_img.width):
            r, g, b, a = pixels[x, y]
            if a > 0:
                pixels[x, y] = (r, g, b, 255)

    # Save the modified image
    new_img.save(output_image_path)

for filename in os.listdir(input_dir):
    if filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
        input_image_path = os.path.join(input_dir, filename)
        output_image_path = os.path.join(output_dir, filename)

        resize_and_position(input_image_path, output_image_path)
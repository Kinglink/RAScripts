from PIL import Image
import os

# Specify the path to your input image
input_image_path = 'Licenses/Licenses.png'  # Replace this with your image path


# Create the 'Generated' directory if it doesn't exist
os.makedirs('Output', exist_ok=True)

# Load the input image
img = Image.open(input_image_path)

# Ensure the image has an alpha channel
if img.mode != 'RGBA':
    img = img.convert('RGBA')

# Dimensions for each tile
tile_width, tile_height = 50, 64

# Number of tiles in each row and column
tiles_across, tiles_down = 5, 5

# New size with padding
new_width = 64
new_height = 64

# Process each tile
for i in range(tiles_down):
    for j in range(tiles_across):
        # Calculate the coordinates of the top-left corner of the current tile
        left = j * tile_width
        top = i * tile_height
        right = left + tile_width
        bottom = top + tile_height

        # Crop the tile from the image
        tile = img.crop((left, top, right, bottom))

        # Process pixels to adjust alpha values
        pixels = tile.load()
        for x in range(tile.width):
            for y in range(tile.height):
                r, g, b, a = pixels[x, y]
                if a > 0:
                    pixels[x, y] = (r, g, b, 255)

        # Create a new image with transparent background
        padded_tile = Image.new('RGBA', (new_width, new_height), (0, 0, 0, 0))

        # Paste the original tile into the center of the new image
        padded_tile.paste(tile, (7, 0))  # 7 pixels padding on the left, none on the top

        # Save the tile
        tile_number = i * tiles_across + j + 1  # Calculate tile number
        output_path = os.path.join('Output', f'tile_{tile_number}.png')
        padded_tile.save(output_path)

print("Tiles processing completed.")

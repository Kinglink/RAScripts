import os
from PIL import Image

# Directory to scan
base_dir = r"H:\Ps2\Wagnan\quickBMS\extracted"

# File extensions to consider
texture_extensions = ['.tm2', '.png']  # Add more if needed

# Heuristic limits for font glyphs
MAX_GLYPH_TILE_SIZE = 32  # glyphs are usually small
MAX_IMAGE_SIZE = 512      # overall texture size for font TIMs is usually small

# Function to scan images
def is_likely_font(image_path):
    try:
        img = Image.open(image_path)
        width, height = img.size

        # Heuristic 1: small total image size
        if width > MAX_IMAGE_SIZE or height > MAX_IMAGE_SIZE:
            return False

        # Heuristic 2: check if it contains small repeated tiles
        # We'll just approximate by looking for small width/height <= MAX_GLYPH_TILE_SIZE
        if width // MAX_GLYPH_TILE_SIZE < 4 or height // MAX_GLYPH_TILE_SIZE < 4:
            # too few tiles horizontally/vertically to be a font sheet
            return False

        return True
    except Exception as e:
        return False

# Walk through the directory
candidate_files = []

for root, dirs, files in os.walk(base_dir):
    for file in files:
        ext = os.path.splitext(file)[1].lower()
        if ext in texture_extensions:
            full_path = os.path.join(root, file)
            if is_likely_font(full_path):
                candidate_files.append(full_path)

print("Likely font/texture candidates:")
for f in candidate_files:
    print(f)

import os
from PIL import Image, ImageDraw, ImageFont

# Settings
BASE_IMAGE = 'Generated/Friend_Icon.png'
NUMBERS = [50, 100, 150, 200, 250, 300, 350, 357]
FONT_SIZE = 18  # This size worked well for 64x64
OUTPUT_DIR = "Output"

if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

def get_windows_font(size):
    # List of common Windows font names/paths
    font_names = ["arialbd.ttf", "Arial Bold", "C:\\Windows\\Fonts\\arialbd.ttf"]
    for name in font_names:
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()

def generate_badges():
    # Load your original 64x64 image
    try:
        base_img = Image.open(BASE_IMAGE).convert("RGBA")
    except FileNotFoundError:
        print(f"Error: Place {BASE_IMAGE} in this folder.")
        return

    # Using Arial Bold for Windows compatibility
    try:
        font = ImageFont.truetype("arialbd.ttf", FONT_SIZE)
    except OSError:
        font = ImageFont.load_default()

    for num in NUMBERS:
        text = str(num)
        
        # 1. Create white background and paste original icon
        canvas = Image.new("RGBA", (64, 64), (255, 255, 255, 255))
        canvas.paste(base_img, (0, 0), base_img)
        draw = ImageDraw.Draw(canvas)
        
        # 2. Get dimensions for Bottom-Right positioning
        bbox = font.getbbox(text)
        tw = bbox[2] - bbox[0]
        th = bbox[3] - bbox[1]

        # 3. BOTTOM-RIGHT MATH:
        # X: Total Width (64) - Text Width - Padding
        # Y: Total Height (64) - Text Height - Padding
        padding = 4
        x_pos = 64 - tw - padding
        y_pos = 64 - th - padding - 4 # Additional offset for font descent

        # 4. Draw: White text, Black 1px stroke
        draw.text((x_pos, y_pos), text, font=font, fill="white", 
                  stroke_width=1, stroke_fill="black")
        
        # 5. Save
        save_path = os.path.join(OUTPUT_DIR, f"badge_{num}.png")
        canvas.save(save_path)
        print(f"Saved: badge_{num}.png")

if __name__ == "__main__":
    generate_badges()
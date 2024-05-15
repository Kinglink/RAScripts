from PIL import Image
import os

def diagonal_cut_alpha_ul_to_br(image):
    width, height = image.size
    pixels = image.load()

    for y in range(height):
        for x in range(width):
            if x + y >= width:  # upper left to bottom right
                pixels[x, y] = (0, 0, 0, 0)  # alpha out

    return image

def apply_overlay(base_img, overlay_img):
    base_img.paste(overlay_img, (0, 0), overlay_img)
    return base_img

def process_images(characters_dir, game_overlays_dir, gold_overlay_path, output_dir):
    # Load the overlay images
    skill_overlay = Image.open(os.path.join(game_overlays_dir, 'Skill_cut.png')).convert("RGBA")
    license_overlay = Image.open(os.path.join(game_overlays_dir, 'License_cut.png')).convert("RGBA")
    level_overlay = Image.open(os.path.join(game_overlays_dir, 'Level_cut.png')).convert("RGBA")
    gold_overlay = Image.open(gold_overlay_path).convert("RGBA")
    
    overlays = [skill_overlay, license_overlay, level_overlay]
    overlay_names = ["Skill", "License", "Level"]

    # Ensure the output directory exists
    os.makedirs(output_dir, exist_ok=True)

    # Process each character image
    for filename in os.listdir(characters_dir):
        if filename.endswith('.png'):
            char_img_path = os.path.join(characters_dir, filename)
            char_img = Image.open(char_img_path).convert("RGBA")

            for overlay, name in zip(overlays, overlay_names):
                combined_img = apply_overlay(char_img.copy(), overlay)
                final_img = apply_overlay(combined_img, gold_overlay)
                output_path = os.path.join(output_dir, f"{os.path.splitext(filename)[0]}_{name}_Gold.png")
                final_img.save(output_path)
                print(f"Saved: {output_path}")

if __name__ == "__main__":
    characters_dir = "Characters"  # Replace with the path to the Characters folder
    game_overlays_dir = "Game_Overlay"  # Replace with the path to the Game_Overlays folder
    gold_overlay_path = "..\Overlays\Gold_Overlay.png"  # Replace with the path to Gold_Overlays.png
    output_dir = "Output"  # Replace with the path to the desired output folder

    process_images(characters_dir, game_overlays_dir, gold_overlay_path, output_dir)

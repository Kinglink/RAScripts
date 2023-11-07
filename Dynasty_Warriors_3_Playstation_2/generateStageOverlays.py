from PIL import Image
import os

# Path to the sky background image
sky_background_path = "Generated/BlackBackground.png"  # Replace with the path to your sky background image

# Path to the gold overlay image
gold_overlay_path = "../Overlays/Gold Overlay.png"  # Replace with the path to your gold overlay image

# Directory containing stage overlays
stage_overlay_dir = "Generated/StagesResized"

# Directory containing faction overlays
faction_overlay_dir = "Overlay"

# Directory to save the final compositions
output_dir = "Output"

# Path to the bronze overlay image
bronze_overlay_path = "../Overlays/Bronze Overlay.png"  # Replace with the path to your bronze overlay image
other_overlay_path = "Overlay/Other.png"  # Replace with the path to your bronze overlay image


# Open the sky background image, gold overlay, and bronze overlay
sky_background = Image.open(sky_background_path)
gold_overlay = Image.open(gold_overlay_path)
bronze_overlay = Image.open(bronze_overlay_path)
other_overlay = Image.open(other_overlay_path)

# Iterate through the images in the stage overlay directory
for stage_overlay_filename in os.listdir(stage_overlay_dir):
    if stage_overlay_filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
        stage_overlay_path = os.path.join(stage_overlay_dir, stage_overlay_filename)

        # Open the stage overlay image
        stage_overlay = Image.open(stage_overlay_path)

        # Iterate through the images in the faction overlay directory
        for faction_overlay_filename in os.listdir(faction_overlay_dir):
            if faction_overlay_filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
                faction_overlay_path = os.path.join(faction_overlay_dir, faction_overlay_filename)

                # Open the faction overlay image
                faction_overlay = Image.open(faction_overlay_path)

                # Combine the images for the first composition (gold overlay)
                composition_gold = Image.new("RGBA", sky_background.size)
                composition_gold.paste(sky_background, (0, 0))
                composition_gold.paste(stage_overlay, (0, 0), stage_overlay)
                composition_gold.paste(faction_overlay, (0, 0), faction_overlay)
                composition_gold.paste(gold_overlay, (0, 0), gold_overlay)

                # Generate the output file name, replacing spaces with underscores
                stage_overlay_name = stage_overlay_filename.replace(" ", "_")
                faction_overlay_name = faction_overlay_filename.replace(" ", "_")
                output_filename_gold = f"{stage_overlay_name}_{faction_overlay_name}_composition_gold.png"
                output_path_gold = os.path.join(output_dir, output_filename_gold)

                # Save the first composition with gold overlay
                composition_gold.save(output_path_gold)

                # Combine the images for the second composition (bronze overlay)
                composition_bronze = Image.new("RGBA", sky_background.size)
                composition_bronze.paste(sky_background, (0, 0))
                composition_bronze.paste(stage_overlay, (0, 0), stage_overlay)
                composition_bronze.paste(faction_overlay, (0, 0), faction_overlay)
                composition_bronze.paste(bronze_overlay, (0, 0), bronze_overlay)

                # Generate the output file name for the second composition, replacing spaces with underscores
                output_filename_bronze = f"{stage_overlay_name}_{faction_overlay_name}_composition_bronze.png"
                output_path_bronze = os.path.join(output_dir, output_filename_bronze)

                # Save the second composition with bronze overlay
                composition_bronze.save(output_path_bronze)

       
                

# Close the images
sky_background.close()
gold_overlay.close()
bronze_overlay.close()
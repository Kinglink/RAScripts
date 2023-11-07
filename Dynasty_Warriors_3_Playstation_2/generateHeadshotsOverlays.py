from PIL import Image
import os

base_dir = "Generated\\HeadshotsResized"
overlay_dir = "..\\Overlays"
output_dir = "."
sky_background_path = "Generated\\SkyBackground.png"  # Path to your sky background image

# Load the sky background image
sky_background = Image.open(sky_background_path)
sky_background = sky_background.convert("RGBA")

# Iterate through each image in the base directory
for base_filename in os.listdir(base_dir):
    if base_filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
        base_image_path = os.path.join(base_dir, base_filename)

        # Open the base image
        base_image = Image.open(base_image_path)
        base_image = base_image.convert("RGBA")

        # Iterate through each image in the overlay directory
        for overlay_filename in os.listdir(overlay_dir):
            if overlay_filename.endswith(('.png', '.jpg', '.jpeg', '.gif')):  # Add more supported extensions if needed
                overlay_image_path = os.path.join(overlay_dir, overlay_filename)

                # Open the overlay image
                overlay_image = Image.open(overlay_image_path)
                overlay_image = overlay_image.convert("RGBA")

                # Resize overlay image to match the size of the base image if needed
                if base_image.size != overlay_image.size:
                    overlay_image = overlay_image.resize(base_image.size, Image.ANTIALIAS)

                # Blend the overlay onto the base image
                result_image = Image.alpha_composite(base_image, overlay_image)

                # Paste the result image onto the sky background
                sky_background.paste(result_image, (0, 0), result_image)

                # Generate the output file name by concatenating base and overlay file names
                base_file_name, _ = os.path.splitext(base_filename)
                overlay_file_name, _ = os.path.splitext(overlay_filename)
                output_filename = f"{base_file_name}_{overlay_file_name}.png"

                # Replace spaces with underscores in the output file name
                output_filename = output_filename.replace(" ", "_")

                output_image_path = os.path.join(output_dir, output_filename)

                # Save the resulting image with the sky background
                sky_background.save(output_image_path)

                # Close the overlay image
                overlay_image.close()

        # Close the base image
        base_image.close()

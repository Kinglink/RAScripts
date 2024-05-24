from PIL import Image
import os

def resize_apply_black_background_and_alpha_overlay(input_directory, overlay_path, output_directory, suffix=None):
    # Ensure the output directory exists
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # Load the overlay image
    overlay_image = Image.open(overlay_path).convert("RGBA")

    # Process each PNG image in the input directory
    for input_image_name in os.listdir(input_directory):
        if input_image_name.lower().endswith('.png'):
            input_image_path = os.path.join(input_directory, input_image_name)
            
            # Resize the input image to 64x64
            input_image = Image.open(input_image_path)
            input_image = input_image.resize((64, 64), resample=Image.LANCZOS)
            input_image_rgba = input_image.convert("RGBA")

            # Apply the overlay
            result_image = Image.alpha_composite(input_image_rgba, overlay_image.resize(input_image.size))

            # Define the new file name with suffix if provided
            if suffix:
                base_name = os.path.splitext(input_image_name)[0]
                new_file_name = f"{base_name}_{suffix}.png"
            else:
                new_file_name = input_image_name

            # Save the result
            result_image_path = os.path.join(output_directory, new_file_name)
            result_image.save(result_image_path)

# Example usage
resize_apply_black_background_and_alpha_overlay("Generated", "../Overlays/Gold_Overlay.png", "Badges", "Gold")
resize_apply_black_background_and_alpha_overlay("Generated", "../Overlays/Silver_Overlay.png", "Badges", "Silver")
resize_apply_black_background_and_alpha_overlay("Generated", "../Overlays/Bronze_Overlay.png", "Badges", "Bronze")


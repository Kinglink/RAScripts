from PIL import Image
import os

def apply_overlays(input_directory, main_overlay_directory, upper_lower_directory, output_directory):
    # Ensure the output directory exists
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # List the upper and lower overlays including an option for no overlay
    upper_lower_overlays = ['none'] + os.listdir(upper_lower_directory)

    # Process each image in the input directory
    for input_image_name in os.listdir(input_directory):
        input_image_path = os.path.join(input_directory, input_image_name)
        if os.path.isfile(input_image_path):
            # Resize the input image to 64x64
            original_image = Image.open(input_image_path)
            original_image = original_image.resize((64, 64))

            # Apply each upper/lower overlay option
            for upper_lower_overlay_name in upper_lower_overlays:
                if upper_lower_overlay_name == 'none':
                    modified_image = original_image
                else:
                    overlay_path = os.path.join(upper_lower_directory, upper_lower_overlay_name)
                    upper_lower_overlay = Image.open(overlay_path)
                    upper_lower_overlay = upper_lower_overlay.resize((64, 64), resample=Image.LANCZOS)
                    upper_lower_mask = upper_lower_overlay.split()[-1]
                    modified_image = original_image.copy()
                    modified_image.paste(upper_lower_overlay, (0, 0), upper_lower_mask)

                # Apply each main overlay image from the overlay directory
                for main_overlay_image_name in os.listdir(main_overlay_directory):
                    main_overlay_image_path = os.path.join(main_overlay_directory, main_overlay_image_name)
                    if os.path.isfile(main_overlay_image_path):
                        # Resize main overlay image to 32x32
                        main_overlay_image = Image.open(main_overlay_image_path)
                        main_overlay_image = main_overlay_image.resize((32, 32), resample=Image.LANCZOS)
                        main_overlay_mask = main_overlay_image.split()[-1]

                        # Create a copy of the modified image to overlay on
                        result_image = modified_image.copy()
                        result_image.paste(main_overlay_image, (0, 32), main_overlay_mask)

                        # Save the result
                        result_image_name = f"{input_image_name}_{upper_lower_overlay_name}_{main_overlay_image_name}"
                        result_image_path = os.path.join(output_directory, result_image_name)
                        result_image.save(result_image_path)

# Example usage
apply_overlays("Generated", "StageOverlays", "UpperLowerOverlays", "Output")

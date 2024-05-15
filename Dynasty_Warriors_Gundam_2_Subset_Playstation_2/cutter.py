from PIL import Image

# Load the new image
nine_licenses_img = Image.open('Nine_Licenses.png')

# Define the function to alpha out the bottom left corner of an image, cut diagonally from upper left to lower right
def diagonal_cut_alpha_ul_to_br(image):
    width, height = image.size
    pixels = image.load()

    for y in range(height):
        for x in range(width):
            if x > y:  # bottom left triangle alphaed out
                pixels[x, y] = (0, 0, 0, 0)

    return image

# Apply the diagonal cut to the new image
nine_licenses_img = diagonal_cut_alpha_ul_to_br(nine_licenses_img.convert("RGBA"))

# Save the modified image
nine_licenses_img.save('Nine_Licenses_cut_corrected.png')
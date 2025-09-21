import os
import easyocr
from tqdm import tqdm

# --- Configuration ---
root_dir = r"H:\Ps2\Wagnan\quickBMS\extracted"  # Root directory to search
output_file = "ocr_results.txt"                   # File to save full OCR results
target_chars = ["零", "奈"]                        # Characters we're specifically looking for

# --- Initialize EasyOCR (CPU mode) ---
reader = easyocr.Reader(['ja'], gpu=False)

# --- Find all PNG files ---
png_files = []
for dirpath, _, filenames in os.walk(root_dir):
    for f in filenames:
        if f.lower().endswith(".png"):
            png_files.append(os.path.join(dirpath, f))

print(f"Found {len(png_files)} PNG images to process.\n")

# --- Dictionaries to store results ---
all_results = {}      # All OCR results
reina_summary = {}    # Images containing target characters

# --- Process each image ---
for img_path in tqdm(png_files, desc="Processing images", unit="img"):
    try:
        results = reader.readtext(img_path)
        texts = [text for _, text, _ in results]
        all_results[img_path] = texts

        # Check for target characters
        filtered_texts = [t for t in texts if any(c in t for c in target_chars)]
        if filtered_texts:
            reina_summary[img_path] = filtered_texts
            print(f"[{img_path}] Contains target chars: {' | '.join(filtered_texts)}")

    except Exception as e:
        print(f"Error processing {img_path}: {e}")

# --- Save all OCR results ---
with open(output_file, "w", encoding="utf-8") as f:
    for path, texts in all_results.items():
        f.write(f"[{path}] Detected text: {' | '.join(texts)}\n")

# --- Print summary ---
print("\n=== Summary of images containing 零 or 奈 ===")
for path, texts in reina_summary.items():
    print(f"[{path}] -> {' | '.join(texts)}")

print(f"\nOCR processing complete. Full results saved to {output_file}.")

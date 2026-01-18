import json
import os
import re
import sys

# Regex
NOTES_ADDR_REGEX = re.compile(r'0x[0-9A-Fa-f]{5,8}')
USER_ADDR_REGEX = re.compile(r'N\d+:0x([0-9A-Fa-f]{8})')
PLACEHOLDER_REGEX = re.compile(r'\{(\w+)\}')

def hex_to_int(value):
    """Convert hex or decimal string to int."""
    if isinstance(value, int):
        return value
    value = str(value).strip()
    if value.lower().startswith("0x"):
        return int(value, 16)
    return int(value)

def normalize_address(addr):
    """Return 8-digit uppercase hex address."""
    return f"{addr:08X}"

def load_text(path):
    if not os.path.exists(path):
        return ""
    with open(path, "r", encoding="utf-8") as f:
        return f.read()

def extract_notes_addresses(text):
    return {normalize_address(int(m, 16)) for m in NOTES_ADDR_REGEX.findall(text)}

def extract_user_addresses(text):
    return {m.upper() for m in USER_ADDR_REGEX.findall(text)}

# ============================
# 🔥 SCHEMA NORMALIZATION FIX
# ============================
def normalize_schema_numeric_keys(obj):
    """
    Convert dictionary keys that look numeric (hex or decimal)
    into integer keys recursively.
    """
    if isinstance(obj, dict):
        new = {}
        for k, v in obj.items():
            new_key = k
            if isinstance(k, str):
                try:
                    new_key = hex_to_int(k)
                except ValueError:
                    pass
            new[new_key] = normalize_schema_numeric_keys(v)
        return new

    if isinstance(obj, list):
        return [normalize_schema_numeric_keys(v) for v in obj]

    return obj

def build_context(outer_idx, inner_idx, schema, placeholders):
    """
    Build context dictionary for placeholder substitution.
    """
    context = {
        "index": outer_idx,
        "index_1": outer_idx + 1,
        "inner_index": inner_idx,
        "inner_index_1": inner_idx + 1
    }

    for placeholder in placeholders:
        if placeholder in context:
            continue

        source = schema.get(placeholder)

        if isinstance(source, dict):
            # VALUE-BASED lookup (hex == decimal)
            context[placeholder] = source.get(outer_idx, "")

        elif isinstance(source, list):
            if outer_idx < len(source):
                context[placeholder] = source[outer_idx]
            else:
                context[placeholder] = ""

        else:
            context[placeholder] = source

    return context

def main():
    if len(sys.argv) < 2:
        print("Usage: python noteGenerator.py <schema_file.json> [--real]")
        sys.exit(1)

    schema_path = sys.argv[1]
    real_run = "--real" in sys.argv

    with open(schema_path, "r", encoding="utf-8") as f:
        schema = json.load(f)

    # 🔥 Normalize schema numeric keys ONCE
    schema = normalize_schema_numeric_keys(schema)

    notes_text = load_text(schema["files"]["notes"])
    user_text = load_text(schema["files"]["user"])

    documented = extract_notes_addresses(notes_text) | extract_user_addresses(user_text)
    additions = []

    for block in schema["blocks"]:
        start = hex_to_int(block["start"])
        stride = hex_to_int(block["stride"])
        number = hex_to_int(block.get("number", 0))
        inner_repeat = hex_to_int(block.get("inner_repeat", 1))
        inner_stride = hex_to_int(block.get("inner_stride", 0))

        total_iterations = number + 1

        # Collect placeholders used
        placeholders = set()
        for line in block["note"]:
            placeholders.update(PLACEHOLDER_REGEX.findall(line))

        for outer_idx in range(total_iterations):
            entry_base = start + (outer_idx * stride)

            for inner_idx in range(inner_repeat):
                addr = entry_base + (inner_idx * inner_stride)
                norm = normalize_address(addr)

                if norm in documented:
                    continue

                context = build_context(
                    outer_idx=outer_idx,
                    inner_idx=inner_idx,
                    schema=schema,
                    placeholders=placeholders
                )

                body = "\\r\\n".join(
                    line.format(**context) for line in block["note"]
                )

                record = f'N0:0x{norm}:"{body}\\r\\n"'
                additions.append(record)
                documented.add(norm)

    if real_run:
        if additions:
            with open(schema["files"]["user"], "a", encoding="utf-8") as f:
                f.write("\n" + "\n".join(additions))
            print(f"[OK] Added {len(additions)} entries to {schema['files']['user']}")
        else:
            print("[OK] No new entries needed")
    else:
        print("[DRY RUN] Generated entries:")
        for line in additions:
            print(line)

if __name__ == "__main__":
    main()

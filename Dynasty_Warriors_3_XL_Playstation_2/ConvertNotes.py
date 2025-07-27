# -*- coding: utf-8 -*-
import json

# File containing your JSON input
input_file = "OldNotes.json"
output_file = "20783-User.json"

with open(input_file, "r", encoding="utf-8") as f:
    data = json.load(f)

output_lines = []
output_lines.append("1.3.1.0")
output_lines.append("Dynasty Warriors 3: Xtreme Legends")

for idx, entry in enumerate(data):
    address = entry["Address"].lower().replace("0x", "")
    address = address.rjust(6, '0')
    note = entry["Note"].replace("\r", "").replace("\n", " ").replace('"', "'")
    output_lines.append(f"N0:0x{address}:{json.dumps(note)}")

with open(output_file, "w", encoding="utf-8") as f:
    for line in output_lines:
        f.write(line + "\n")

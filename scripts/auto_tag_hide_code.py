import os
import json

# Path to your notebooks folder
notebooks_dir = "notebooks"

for filename in os.listdir(notebooks_dir):
    if filename.endswith(".ipynb"):
        path = os.path.join(notebooks_dir, filename)

        with open(path, "r", encoding="utf-8") as f:
            nb = json.load(f)

        modified = False

        # Loop through cells
        for cell in nb.get("cells", []):
            if cell.get("cell_type") == "code":
                metadata = cell.setdefault("metadata", {})
                tags = metadata.setdefault("tags", [])

                if "hide-input" not in tags:
                    tags.append("hide-input")
                    modified = True

        # Save back if changed
        if modified:
            with open(path, "w", encoding="utf-8") as f:
                json.dump(nb, f, indent=1, ensure_ascii=False)
            print(f"✅ Updated: {filename}")
        else:
            print(f"Skipped (already tagged): {filename}")

from PIL import Image
import numpy as np

def find_and_remove_stray_red(img_path, keep_box_y_range, description):
    """Remove all red-ish pixels outside the keep_box_y_range."""
    print(f"\nProcessing {description}...")
    img = Image.open(img_path)
    arr = np.array(img)
    h, w = arr.shape[:2]
    
    keep_min_y, keep_max_y = keep_box_y_range
    replaced = 0
    
    for y in range(h):
        if keep_min_y <= y <= keep_max_y:
            continue  # skip the Delete box region
        for x in range(w):
            r, g, b = int(arr[y, x, 0]), int(arr[y, x, 1]), int(arr[y, x, 2])
            # Detect any reddish annotation pixels (including faded/anti-aliased ones)
            # Red channel dominant, with enough difference from gray
            if r > 150 and (r - g) > 40 and (r - b) > 40:
                # Replace with nearest non-red pixel
                found = False
                for radius in range(1, 15):
                    if found:
                        break
                    for dy in range(-radius, radius+1):
                        if found:
                            break
                        for dx in range(-radius, radius+1):
                            ny, nx = y+dy, x+dx
                            if 0 <= ny < h and 0 <= nx < w:
                                nr, ng, nb = int(arr[ny, nx, 0]), int(arr[ny, nx, 1]), int(arr[ny, nx, 2])
                                if not (nr > 150 and (nr - ng) > 40 and (nr - nb) > 40):
                                    arr[y, x] = arr[ny, nx]
                                    replaced += 1
                                    found = True
                                    break
    
    print(f"  Replaced {replaced} pixels")
    result = Image.fromarray(arr)
    result.save(img_path)
    print(f"  Saved.")

# Dashboard: Delete box is approximately y=262-290 based on previous scan
# The stray box was at y=211-245
find_and_remove_stray_red(
    r"C:\repos\powerbi-docs-pr\powerbi-docs\create-reports\media\service-delete\power-bi-delete-dashboard.png",
    keep_box_y_range=(255, 300),
    description="Dashboard screenshot"
)

# App: Delete box is approximately y=247-275
# The stray box was at y=299-338
find_and_remove_stray_red(
    r"C:\repos\powerbi-docs-pr\powerbi-docs\create-reports\media\service-delete\power-bi-delete-app.png",
    keep_box_y_range=(240, 280),
    description="App screenshot"
)

print("\nDone!")

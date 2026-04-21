from PIL import Image
import numpy as np

def is_red(pixel, threshold=60):
    """Check if a pixel is part of a red annotation box."""
    r, g, b = pixel[:3]
    return r > 180 and g < threshold and b < threshold

def find_red_boxes(img_array):
    """Find bounding boxes of connected red regions."""
    h, w = img_array.shape[:2]
    red_mask = np.zeros((h, w), dtype=bool)
    for y in range(h):
        for x in range(w):
            p = img_array[y, x]
            if p[0] > 180 and p[1] < 70 and p[2] < 70:
                red_mask[y, x] = True
    
    # Find connected components using simple flood fill
    visited = np.zeros((h, w), dtype=bool)
    boxes = []
    
    for y in range(h):
        for x in range(w):
            if red_mask[y, x] and not visited[y, x]:
                # BFS to find connected component
                queue = [(y, x)]
                visited[y, x] = True
                min_y, max_y, min_x, max_x = y, y, x, x
                pixel_count = 0
                while queue:
                    cy, cx = queue.pop(0)
                    pixel_count += 1
                    min_y = min(min_y, cy)
                    max_y = max(max_y, cy)
                    min_x = min(min_x, cx)
                    max_x = max(max_x, cx)
                    for dy, dx in [(-1,0),(1,0),(0,-1),(0,1),(-1,-1),(-1,1),(1,-1),(1,1)]:
                        ny, nx = cy+dy, cx+dx
                        if 0 <= ny < h and 0 <= nx < w and red_mask[ny, nx] and not visited[ny, nx]:
                            visited[ny, nx] = True
                            queue.append((ny, nx))
                if pixel_count > 20:  # ignore tiny noise
                    boxes.append((min_y, max_y, min_x, max_x, pixel_count))
    return boxes, red_mask

def remove_red_box(img_array, red_mask, min_y, max_y, min_x, max_x):
    """Replace red pixels in a bounding box with nearby non-red pixels."""
    h, w = img_array.shape[:2]
    for y in range(max(0, min_y-1), min(h, max_y+2)):
        for x in range(max(0, min_x-1), min(w, max_x+2)):
            if red_mask[y, x]:
                # Find nearest non-red pixel
                for radius in range(1, 15):
                    found = False
                    for dy in range(-radius, radius+1):
                        for dx in range(-radius, radius+1):
                            ny, nx = y+dy, x+dx
                            if 0 <= ny < h and 0 <= nx < w and not red_mask[ny, nx]:
                                img_array[y, x] = img_array[ny, nx]
                                found = True
                                break
                        if found:
                            break
                    if found:
                        break

# Process dashboard screenshot
print("Processing dashboard screenshot...")
img = Image.open(r"C:\repos\powerbi-docs-pr\powerbi-docs\create-reports\media\service-delete\power-bi-delete-dashboard.png")
arr = np.array(img.convert('RGB'))
boxes, red_mask = find_red_boxes(arr)
print(f"Found {len(boxes)} red regions:")
for i, (min_y, max_y, min_x, max_x, count) in enumerate(boxes):
    print(f"  Box {i}: y={min_y}-{max_y}, x={min_x}-{max_x}, pixels={count}")

boxes_sorted = sorted(boxes, key=lambda b: b[0])  # sort by min_y
print(f"\nBoxes sorted by y-position (top to bottom):")
for i, (min_y, max_y, min_x, max_x, count) in enumerate(boxes_sorted):
    print(f"  Box {i}: y={min_y}-{max_y}, x={min_x}-{max_x}, pixels={count}")

if len(boxes_sorted) >= 2:
    for i, (min_y, max_y, min_x, max_x, count) in enumerate(boxes_sorted):
        if i == 0:  # top box = stray box around "Explore this data"
            print(f"\nRemoving stray box {i} at y={min_y}-{max_y}")
            remove_red_box(arr, red_mask, min_y, max_y, min_x, max_x)

result = Image.fromarray(arr)
result.save(r"C:\repos\powerbi-docs-pr\powerbi-docs\create-reports\media\service-delete\power-bi-delete-dashboard.png")
print("Dashboard screenshot saved.")

# Process app screenshot
print("\nProcessing app screenshot...")
img2 = Image.open(r"C:\repos\powerbi-docs-pr\powerbi-docs\create-reports\media\service-delete\power-bi-delete-app.png")
arr2 = np.array(img2.convert('RGB'))
boxes2, red_mask2 = find_red_boxes(arr2)
print(f"Found {len(boxes2)} red regions:")
for i, (min_y, max_y, min_x, max_x, count) in enumerate(boxes2):
    print(f"  Box {i}: y={min_y}-{max_y}, x={min_x}-{max_x}, pixels={count}")

boxes2_sorted = sorted(boxes2, key=lambda b: b[0])
print(f"\nBoxes sorted by y-position:")
for i, (min_y, max_y, min_x, max_x, count) in enumerate(boxes2_sorted):
    print(f"  Box {i}: y={min_y}-{max_y}, x={min_x}-{max_x}, pixels={count}")

if len(boxes2_sorted) >= 2:
    for i, (min_y, max_y, min_x, max_x, count) in enumerate(boxes2_sorted):
        if i == len(boxes2_sorted) - 1:  # bottom box = stray
            print(f"\nRemoving stray box {i} at y={min_y}-{max_y}")
            remove_red_box(arr2, red_mask2, min_y, max_y, min_x, max_x)

result2 = Image.fromarray(arr2)
result2.save(r"C:\repos\powerbi-docs-pr\powerbi-docs\create-reports\media\service-delete\power-bi-delete-app.png")
print("App screenshot saved.")
print("\nDone!")

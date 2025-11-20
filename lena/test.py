import numpy as np
import matplotlib.pyplot as plt

# 📌 Modifier ici selon la taille de votre image
image_width =225
image_height = 225

# 📌 Chemins vers les fichiers
input_file = "lena.grey"
output_file = "output.grey"

def load_grey_image(filename, width, height):
    with open(filename, "rb") as f:
        data = np.fromfile(f, dtype=np.uint8)
    if data.size != width * height:
        raise ValueError(f"Taille incorrecte : attendue {width*height} octets, obtenu {data.size}")
    return data.reshape((height, width))

# Chargement des images
input_image = load_grey_image(input_file, image_width, image_height)
output_image = load_grey_image(output_file, image_width, image_height)

# Affichage côte à côte
plt.figure(figsize=(10, 5))

plt.subplot(1, 2, 1)
plt.title("Image d'entrée")
plt.imshow(input_image, cmap='gray', vmin=0, vmax=255)
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title("Image de sortie")
plt.imshow(output_image, cmap='gray', vmin=0, vmax=255)
plt.axis('off')

plt.tight_layout()
plt.show()

#!/usr/bin/env python3
#@author David Spreekmeester <david@spreekmeester.nl>
import sys
from PIL import Image

# Percentage of blackish pixels required for the image to be considered blackish
threshold_pixels = 90
# Max percentage of pixel brightness to consider it blackish
dark_is_black_threshold = 20

if len(sys.argv) < 2:
    raise TypeError('No file input given. Please provide file path.')

def is_blackish(image_path):
    return how_blackish(image_path) > (threshold_pixels / 100)

def how_blackish(image_path):
    image = Image.open(image_path)
    bands = image.getbands()
    if image.mode != 'RGB':
        raise TypeError('No RGB image')

    # Check if the image has very low color saturation
    hsv = image.convert('HSV')
    h, s, v = hsv.split()
    v_pixels = v.getdata()
    num_dark_pixels = sum(1 for pixel in v_pixels if pixel < dark_is_black_threshold)

    return (num_dark_pixels / len(v_pixels))

print(1 if is_blackish(sys.argv[1]) else 0)

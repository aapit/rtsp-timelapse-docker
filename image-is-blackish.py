#!/usr/bin/env python3
#@author David Spreekmeester <david@spreekmeester.nl>
import sys
from PIL import Image

if len(sys.argv) < 2:
    raise TypeError('No file input given. Please provide file path.')

def is_blackish(image_path):
    image = Image.open(image_path)
    bands = image.getbands()
    if image.mode != 'RGB':
        raise TypeError('No RGB image')

    r, g, b = image.split()
    if not (r.getextrema() == g.getextrema() == b.getextrema()):
        return 0

    # Check if the image has very low color saturation
    hsv = image.convert('HSV')
    h, s, v = hsv.split()
    sat_pixels = s.getdata()
    num_low_sat_pixels = sum(1 for pixel in sat_pixels if pixel < 32)

    return int((num_low_sat_pixels / len(sat_pixels) > .92))

print(is_blackish(sys.argv[1]))

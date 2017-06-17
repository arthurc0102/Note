"""
This script resize image to 512 (height or width), check which is bigger
What for? You can use this to make telegram sticker.
How to use? Put the image in a dir name target at your working dir.
"""
import os
import glob

from PIL import Image


working_dir = os.path.dirname(os.path.realpath(__file__))
target_dir = os.path.join(working_dir, 'target')


def image_resize(image, filename):
    global target_dir

    width, height = image.size
    if width > height:
        height, width = int((512 / width) * height), 512
    else:
        width, height = int((512 / height) * width), 512

    image.resize((width, height), Image.BILINEAR)
    new_image = image.resize((width, height), Image.BILINEAR)
    new_image.save(os.path.join(target_dir, filename))


def main():
    global target_dir

    images = glob.glob(os.path.join(target_dir, '*.png'))
    for image in images:
        image_resize(Image.open(os.path.join(target_dir, image)), image)

    print('Done.')


if __name__ == '__main__':
    main()

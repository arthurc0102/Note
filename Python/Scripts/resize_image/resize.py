import sys

from PIL import Image


def init():
    try:
        width = float(sys.argv[2])
    except Exception:
        print('Width that you input is not a number.')
        exit()
    else:
        if width < 0:
            print('Width smaller than 0.')
            exit()

    try:
        height = float(sys.argv[3])
    except Exception:
        print('Height that you input is not a number.')
        exit()
    else:
        if width < 0:
            print('Height smaller then 0.')
            exit()

    if width == 0 and height == 0:
        print('Height and width can\'t both be 0.')
        exit()

    filename = '.'.join(sys.argv[1].split('/')[-1].split('.')[:-1])
    return filename, width, height


def new_image_size(width, height, old_width, old_height):
    if width == 0:
        width = height * old_width / old_height
    elif height == 0:
        height = width * old_height / old_width

    return int(width), int(height)


def main():
    filename, width, height = init()
    image = Image.open(sys.argv[1])
    width, height = new_image_size(width, height, *image.size)
    image.resize((width, height), Image.BILINEAR)
    resize_image = image.resize((width, height), Image.BILINEAR)
    resize_image.save(sys.argv[1].replace(filename, '{}-resize'.format(filename)))
    resize_image.close()
    image.close()


if __name__ == '__main__':
    main()

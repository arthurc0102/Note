import os
import pytesseract

from PIL import Image


working_directory = os.path.dirname(os.path.realpath(__file__))


def main():
    pytesseract.pytesseract.tesseract_cmd = 'C:\\Program Files (x86)\\Tesseract-OCR\\tesseract'
    tessdata_dir_config = '--tessdata-dir "C:\\Program Files (x86)\\Tesseract-OCR\\tessdata"'
    image = Image.open(os.path.join(working_directory, 'image', 'a.png'))
    output = pytesseract.image_to_string(image, lang='chi_tra', config=tessdata_dir_config)
    print(output)


if __name__ == '__main__':
    main()

from PIL import Image, ImageFont, ImageDraw


def main():
    font = ImageFont.truetype("./華康抖抖體.TTC", 65)
    img = Image.new("RGBA", (200, 200), (120, 20, 20))
    draw = ImageDraw.Draw(img)
    draw.text((0, 0), "你好啊", (255, 255, 0), font=font)
    draw = ImageDraw.Draw(img)
    img.save("a_test.png")


if __name__ == '__main__':
    main()

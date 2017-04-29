from PIL import Image, ImageFilter

image = Image.open('./image/dog.jpg')
blurry_image = image.filter(ImageFilter.GaussianBlur)  # 新增模糊濾鏡
blurry_image.save('dog_blurry.jpg')
blurry_image.show()

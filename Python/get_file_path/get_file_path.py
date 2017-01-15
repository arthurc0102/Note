import os


# Print file name
print('file name:', __file__)

# Print file path
print('file path:', os.path.realpath(__file__))

# Print file folder
print(__file__, 'is in', os.path.dirname(os.path.realpath(__file__)))

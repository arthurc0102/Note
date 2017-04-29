import os


def main():
    user_dict = {'HJX010': 'b3df3cd6221547e4',
                 'HJX009': 'c4b784624235cefb',
                 'HJX001': '1d71f32bd47664a0',
                 'HJX002': 'c658e11a1ce1320b',
                 'HJX003': 'ef1de013030ca048',
                 'HJX005': '6e3c939e4c969309',
                 'HJX004': '27d17f54f04fa532',
                 'HJX007': 'e3262624147262cd',
                 'HJX008': '7f2278eba45ef065',
                 'HJX011': '8b88f99fdc932b1a'}

    for username, password in user_dict.items():
        add_user = os.system('useradd {0}'.format(username))
        if add_user == 0:
            os.system('echo \"{1}\n{1}\" | passwd {0}'.
                      format(username, password))
        else:
            print('add user {0} error'.format(username))


if '__main__' == __name__:
    main()

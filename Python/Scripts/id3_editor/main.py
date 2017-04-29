import os
from mp3_tagger import MP3File


def main():
    music_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'music')
    music_list = os.listdir(music_dir)
    for music_name in music_list:
        print(music_name)
        music_file = MP3File(os.path.join(music_dir, music_name))
        artist, song = music_name.split(' - ')
        song = song.split('.')[0]
        try:
            music_file.artist = artist
            music_file.song = song
        except Exception:
            music_file.artist = ''
            music_file.song = ''

        music_file.save()


if __name__ == '__main__':
    main()

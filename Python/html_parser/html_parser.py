# improt
from html.parser import HTMLParser


# html parser
class My_HTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        print('start:', tag)
        for attr in attrs:
            print(attr[0], '-->', attr[1])

    def handle_endtag(self, tag):
        print('end: ', tag)

    def handle_data(self, data):
        print('data: ', data)


def main():
    html = """
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="utf-8">
        <title>hello</title>
        </head>
        <body>
        <div class="test" id="t">a</div>
        </body>
        </html>"""

    my_html_parser = My_HTMLParser()
    my_html_parser.feed(html)


if __name__ == '__main__':
    main()

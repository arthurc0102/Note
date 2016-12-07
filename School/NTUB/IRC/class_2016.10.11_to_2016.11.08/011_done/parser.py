from html.parser import HTMLParser


class Get_web_HTMLParser(HTMLParser):
    in_sticker_name = False
    sticker_name = 'no'
    img_url_list = []

    def handle_starttag(self, tag, attrs):
        if tag == 'h3':
            for attr in attrs:
                if attr[0] == 'class' and attr[1] == 'mdCMN08Ttl':
                    self.in_sticker_name = True
        elif tag == 'span':
            for name, value in attrs:
                if name == 'class' and value == 'mdCMN09Image':
                    self.img_url_list.append(dict(attrs)['style'].split(';')[2].split('(')[1].split(')')[0])

    def handle_endtag(self, tag):
        pass

    def handle_data(self, data):
        if self.in_sticker_name:
            self.sticker_name = data.replace('/', ' | ')
            self.in_sticker_name = False

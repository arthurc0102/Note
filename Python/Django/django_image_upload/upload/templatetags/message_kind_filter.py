from django import template


register = template.Library()


@register.filter(name='message_kind')
def message_kind(message_tag):
    return message_tag if message_tag != 'error' else 'danger'

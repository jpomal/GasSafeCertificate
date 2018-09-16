import re
import datetime

def is_allowed_specific_char(string):
    charRe = re.compile(r'julian')
    string = charRe.search(string)
    return bool(string)

print(is_allowed_specific_char('julian'))


def end_num(string):
    text = re.compile(r".*[0-9]$")
    if text.match(string):
        return True
    else:
        return False

print(end_num("abcdef"))

print(end_num("abcdef8"))

def change_date_format(dt):
    return re.sub(r'(\d{4})-(\d{1,2})-(\d{1,2})', '\\3-\\2-\\1', dt)

dt1 = str(datetime.date.today())

print(change_date_format(dt1))


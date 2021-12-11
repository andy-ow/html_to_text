# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import sys
from bs4 import BeautifulSoup as bs4

def html_to_text(file):
    try:
        with open(file, 'r') as fp:
            soup = bs4(fp,features="lxml")
        #del soup['href']
        print(' '.join(soup.body.stripped_strings))
    except Exception as e:
        print(e)
        print("html_to_text: Could not process file: " + file, file = sys.stderr)
        exit(0)



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage:",sys.argv[0],"<file>", file = sys.stderr)
        exit(0)
    html_to_text(sys.argv[1])

# See PyCharm help at https://www.jetbrains.com/help/pycharm/

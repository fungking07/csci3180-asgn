"""
Name: Lam King Fung
Student ID: 1155108968
"""

color_mode = True # if you want to close the color mode, just set it as False.
if color_mode:
    def g(s): return '\033[92m' + s + '\033[0m'
    def b(s): return '\033[94m' + s + '\033[0m'
else:
    def g(s): return s
    def b(s): return s

def pos2sym(i):
    return chr(ord('a')+i)

def sym2pos(i):
    return ord(i) - ord('a')

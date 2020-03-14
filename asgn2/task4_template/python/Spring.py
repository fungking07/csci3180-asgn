"""
/*
 * CSCI3180 Principles of Programming Languages
 *
 * --- Declaration ---
 *
 * I declare that the assignment here submitted is original except for source
 * material explicitly acknowledged. I also acknowledge that I am aware of
 * University policy and regulations on honesty in academic work, and of the
 * disciplinary guidelines and procedures applicable to breaches of such policy
 * and regulations, as contained in the website
 * http://www.cuhk.edu.hk/policy/academichonesty/
 *
 * Assignment 2
 * Name : Lam King Fung
 * Student ID : 1155108968
 * Email Addr : kflam8@cse.cuhk.edu.hk
 */
"""


from Pos import *
from Soldier import *

class Spring():
    def __init__(self):
        self._num_chance = 1
        self._healing_power = 100
        self._pos = Pos()
    
    def set_pos(self, row, column):
        self._pos.set_pos(row, column)

    def get_pos(self):
        return self._pos

    def action_on_soldier(self, solder):
        self.talk()
        if self._num_chance == 1:
            solder.recover(self._healing_power)
            self._num_chance -= 1
    
    def talk(self):
        print("Spring@: You have {} chance to recover 100 health.".format(self._num_chance), end = "")
        print()
    
    def display_symbol(self):
        print('@', end="")


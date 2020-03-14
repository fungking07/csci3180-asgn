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

from Cell import *
from Pos import *
from Monster import *
from Soldier import *
from Spring import *

class Map():
    def __init__(self):
        self._cells = [[Cell() for i in range(7)] for j in range(7)]

    def add_object(self, object):
        if isinstance(object, list):
            for i in object:
                self._pos = i.get_pos()
                self._cells[self._pos.get_row() - 1][self._pos.get_column() - 1].set_occupied_object(i)
        else:
            self._pos = object.get_pos()

            if self._pos != None:
                self._cells[self._pos.get_row() - 1][self._pos.get_column() - 1].set_occupied_object(object)
    
    def display_map(self):
        print("   | 1 | 2 | 3 | 4 | 5 | 6 | 7 |")
        print("--------------------------------")
        for i in range(7):
            print(" %d |" % (i + 1), end = "")
            for j in range(7):
                occupied_object = self._cells[i][j].get_occupied_object()
                ###print("1234")
                if occupied_object != None:
                    print(" ", end = "")
                    occupied_object.display_symbol()
                    print(" |", end = "")
                else:
                    print("   |", end = "")
            print()
            print("--------------------------------")
        print()
        
    def get_occupied_object(self, row, column):
        return self._cells[row - 1][column - 1].get_occupied_object()

    def check_move(self, row, column):
        return ((row in range(1,8)) and (column in range(1,8)))

    def update(self, solder, old_row, old_column, new_row, new_column):
        self._cells[old_row - 1][old_column - 1].set_occupied_object(None)
        self._cells[new_row - 1][new_column - 1].set_occupied_object(solder)
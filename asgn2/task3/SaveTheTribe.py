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

from Map import *
from Cell import *
from Pos import *
from Monster import *
from Soldier import *
from Spring import *
import random

class SaveTheTribe():
    def __init__:
        self._map = Map()
        self._soldier = Soldier()
        self._spring = Spring()
        self._monsters = list()
        self._game_enabled = True
  
    def initialize(self):
        self._monsters[0] = Monster(1, random.randint(0,5) * 10 + 30)
        self._monsters[0].set_pos(4,1)
        self._monsters[0].add_drop_item(2)
        self._monsters[0].add_drop_item(3)

        self._monsters[1] = Monster(2, random.randint(0,5) * 10 + 30)
        self._monsters[1].setPos(3, 3)
        self._monsters[1].addDropItem(3)
        self._monsters[1].addDropItem(6)
        self._monsters[1].addHint(1)
        self._monsters[1].addHint(5)

        self._monsters[2] = Monster(3, random.randint(0,5) * 10 + 30)
        self._monsters[2].setPos(5, 3)
        self._monsters[2].addDropItem(4)
        self._monsters[2].addHint(1)
        self._monsters[2].addHint(2)

        self._monsters[3] = Monster(4, random.randint(0,5) * 10 + 30)
        self._monsters[3].setPos(5, 5)
        self._monsters[3].addHint(3)
        self._monsters[3].addHint(6)

        self._monsters[4] = Monster(5, random.randint(0,5) * 10 + 30)
        self._monsters[4].setPos(1, 4)
        self._monsters[4].addDropItem(2)
        self._monsters[4].addDropItem(6)

        self._monsters[5] = Monster(6, random.randint(0,5) * 10 + 30)
        self._monsters[5].setPos(3, 5)
        self._monsters[5].addDropItem(4)
        self._monsters[5].addDropItem(7)
        self._monsters[5].addHint(2)
        self._monsters[5].addHint(5)

        self._monsters[6] = Monster(7, random.randint(0,5) * 10 + 30)
        self._monsters[6].setPos(4, 7)
        self._monsters[6].addDropItem(-1)
        self._monsters[6].addHint(6)

        self.map.add_object(self._monsters)

        self.soldier.set_pos(1, 1)
        self.soldier.add_key(1)
        self.soldier.add_key(5)

        self.map.add_object(self._soldier)

        self._spring.set_pos(7, 4)

        self._map.add_object(self._spring)

    def start(self):
        print("=> Welcome to the desert!")
        print("=> Now you have to defeat the monsters and find the artifact to save the tribe.\n")

        while self._game_enabled:
            self._map.display_map()
            self._soldier.display_information()

            move = input("%n=> What is the next step? (W = Up, S = Down, A = Left, D = Light.) Input: ")
            self._pos = self.soldier.get_pos()
            self._old_row = self._new_row = self._pos.get_row()
            self._old_column = self._new_column = self._pos.get_column()

            if move == 'W' or move == 'w':
                self._new_row = self._old_row - 1
            elif move == 'S' or move == 's':
                self._new_row = self._old_row + 1
            elif move == 'A' or move == 'a':
                self._new_column = self._old_column - 1
            elif move == 'D' or move == 'd':
                self._new_column = self._old_column + 1
            else:
                print("=> Illegal move!\n")

            
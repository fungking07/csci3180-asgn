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

from Soldier import Soldier
from Pos import *
import random

class Task4Soldier(Soldier):
    def __init__(self):
        super(Task4Soldier,self).__init__()
        self._coins = 0
        self._shield = 0
                    
    def lose_health(self):
        if(self._shield * 5 >= 10):
            self._health -= 0
        else:
            self._health -= (10 - self._shield * 5)

    def display_information(self):
        super(Task4Soldier, self).display_information()
        print("Defence: {}.".format(self.get_shield() * 5))
        print("Coins: {}.".format(self.get_coins()))
    
    def get_coins(self):
        return self._coins
    
    def get_shield(self):
        return self._shield
    
    def add_coins(self):
        self._coins += 1
    
    def remove_coins(self, amount):
        self._coins -= amount
    
    def add_shield(self):
        self._shield += 1
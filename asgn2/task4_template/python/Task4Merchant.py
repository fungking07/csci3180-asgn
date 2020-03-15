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
from Task4Soldier import *

class Task4Merchant():
    def __init__(self):
        self._elixir_price = 1
        self._shield_price = 2
        self._pos = Pos()
    
    def set_pos(self, row, column):
        self._pos.set_pos(row, column)

    def get_pos(self):
        return self._pos

    def action_on_soldier(self, soldier):
        self._choice = input("Do you want to buy something? (1. Elixir, 2. Shield) Input: ")
        if self._choice == '1':
            if soldier.get_coins() >= self._elixir_price:
                soldier.add_elixir()
                soldier.remove_coins(self._elixir_price)
                self.talk("I'll take 1 coin from you, and here is your elixir. Thank You!\n")
            else:
                self.talk("How pathetic! This poor player wants to buy elixir without paying the right amount. Get out of here!\n")
        elif self._choice == '2':
            if soldier.get_coins() >= self._shield_price:
                soldier.add_shield()
                soldier.remove_coins(self._shield_price)
                self.talk("I'll take 2 coin from you, and here is your shield. Thank You!\n")
            else:
                self.talk("How pathetic! This poor player wants to buy shield without paying the right amount. Get out of here!\n")
        else:
            print("=> Illegal choice!\n")

    def talk(self, text):
        print("Merchant$:{}".format(text), end = "")
        print()
    
    def display_symbol(self):
        print('@', end="")
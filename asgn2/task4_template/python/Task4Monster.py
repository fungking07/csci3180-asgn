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
from Monster import Monster
from Task4Soldier import *

class Task4Monster(Monster):
    def __init__(self, monster_id, health_capacity):
        super(Task4Monster, self).__init__(monster_id, health_capacity)

    def fight(self, soldier):
        fight_enabled = True

        while fight_enabled:
            print("       | Monster{} | Soldier |".format(self._monster_id))
            print("Health | %8d | %7d |\n" % (self._health, soldier.get_health()))
            choise = input("=> What is the next step? (1 = Attack, 2 = Escape, 3 = Use Elixir.) Input: ")

            if choise == '1':
                if self.lose_health():
                    soldier.add_coins()
                    print("=> You defeated Monster{}.\n".format(self._monster_id))
                    self.drop_items(soldier)
                    fight_enabled = False
                else:
                    if soldier.lose_health():
                        self.recover(self._health_capacity)
                        fight_enabled = False
            elif choise == '2':
                self.recover(self._health_capacity)
                fight_enabled = False
            elif choise == '3':
                if soldier.get_num_elixirs() == 0:
                    print("=> You have run out of elixirs.\n")
                else:
                    soldier.use_elixirs()
            else:
                print("=> Illegal choice!\n")

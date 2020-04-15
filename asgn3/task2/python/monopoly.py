"""*
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
* Assignment 3
* Name : Lam King Fung
* Student ID : 1155108968
* Email Addr : kflam8@cse.cuhk.edu.hk
*/"""

import random

random.seed(0) # don't touch!

# you are not allowed to modify Player class!
class Player:
    due = 200
    income = 0
    tax_rate = 0.2
    handling_fee_rate = 0
    prison_rounds = 2

    def __init__(self, name):
        self.name = name
        self.money = 100000
        self.position = 0
        self.num_rounds_in_jail = 0

    def updateAsset(self):
        self.money += Player.income

    def payDue(self):
        self.money += Player.income * (1 - Player.tax_rate)
        self.money -= Player.due * (1 + Player.handling_fee_rate)

    def printAsset(self):
        print("Player %s's money: %d" % (self.name, self.money))

    def putToJail(self):
        self.num_rounds_in_jail = Player.prison_rounds

    def move(self, step):
        if self.num_rounds_in_jail > 0:
            self.num_rounds_in_jail -= 1
        else:
            self.position = (self.position + step) % 36



class Bank:
    def __init__(self):
        pass

    def print(self):
        print("Bank ", end='')

    def stepOn(self):

        # ...
        Player.income = 2000
        Player.tax_rate = 0
        Player.due = 0
        Player.handling_fee_rate = 0
        cur_player.payDue()

        return

class Jail:
    def __init__(self):
        pass

    def print(self):
        print("Jail ", end='')

    def stepOn(self):

        # ...
        response = input("Pay $1000 to reduce the prison round to 1?  [y/n]\n")
        while(response != "y" and response != "n"):
            response = input("Pay $1000 to reduce the prison round to 1?  [y/n]\n")

        Player.prison_rounds = 2
        Player.income = 0
        Player.tax_rate = 0
        Player.due = 0
        Player.handling_fee_rate = 0
        if(response == "y"):
            if (cur_player.money < 1100):
                print ("You do not have enough money to reduce the prison round!")
            else:
                Player.prison_rounds = 1
                Player.income = 0
                Player.tax_rate = 0
                Player.due = 1000
                Player.handling_fee_rate = 0.1

        cur_player.putToJail()


class Land:
    land_price = 1000
    upgrade_fee = [1000, 2000, 5000]
    toll = [500, 1000, 1500, 3000]
    tax_rate = [0.1, 0.15, 0.2, 0.25]

    def __init__(self):
        self.owner = None
        self.level = 0

    def print(self):
        if self.owner is None:
            print("Land ", end='')
        else:
            print("%s:Lv%d" % (self.owner.name, self.level), end="")
    
    def buyLand(self):

        # ...
        Player.income = 0
        Player.tax_rate = 0
        Player.due = 0
        Player.handling_fee_rate = 0

        if(cur_player.money < self.land_price * 0.1):
            print("You do not have enough money to buy the land!")
        else:
            self.owner = cur_player
            Player.income = 0
            Player.tax_rate = 0
            Player.due = 1000
            Player.handling_fee_rate = 0.1

        cur_player.payDue()
    
    def upgradeLand(self):
        
        # ...
        Player.income = 0
        Player.tax_rate = 0
        Player.due = 0
        Player.handling_fee_rate = 0
        
        land_level = self.level
        if(cur_player.money < self.upgrade_fee[land_level]):
            print("You do not have enough money to upgrade the land!")
        else:
            Player.income = 0
            Player.tax_rate = 0
            Player.due = self.upgrade_fee[land_level]
            Player.handling_fee_rate = 0.1
            self.level += 1

        cur_player.payDue()
    
    def chargeToll(self):
        
        # ...
        land_level = self.level
        Player.income = 0
        Player.tax_rate = 0
        Player.due = 1000
        Player.handling_fee_rate = 0.1
        
        toll = 0
        if(cur_player.money < self.toll[land_level]):
            toll = cur_player.money
        else:
            toll = self.toll[land_level]
        
        Player.income = 0
        Player.tax_rate = 0
        Player.due = toll
        Player.handling_fee_rate = 0

        cur_player.payDue()

        # ...
        Player.income = toll
        Player.tax_rate = self.tax_rate[land_level]
        Player.due = 0
        Player.handling_fee_rate = 0

        self.owner.payDue()

    def stepOn(self):

        # ...
        land_level = self.level
        if(self.owner == None):
            response = input("Pay $1000 to buy the land? [y/n]\n")
            while(response != "y" and response != "n"):
                response = input("Pay $1000 to buy the land? [y/n]\n")
            if(response == 'y'):
                self.buyLand()
        else:
            if(self.owner.name == cur_player.name):
                if(land_level < 3):
                    response = input("Pay ${} to upgrade the land? [y/n]\n".format(self.upgrade_fee[land_level]))
                    while(response != "y" and response != "n"):
                        response = input("Pay ${} to upgrade the land? [y/n]\n".format(self.upgrade_fee[land_level]))
                    if(response == 'y'):
                        self.upgradeLand()
            else:
                print("You need to pay player {} ${}".format(self.owner.name, self.toll[land_level]))

        return



players = [Player("A"), Player("B")]
cur_player = players[0]
num_players = len(players)
cur_player_idx = 0
cur_player = players[cur_player_idx]
num_dices = 1
cur_round = 0

game_board = [
    Bank(), Land(), Land(), Land(), Land(), Land(), Land(), Land(), Land(), Jail(),
    Land(), Land(), Land(), Land(), Land(), Land(), Land(), Land(),
    Jail(), Land(), Land(), Land(), Land(), Land(), Land(), Land(), Land(), Jail(),
    Land(), Land(), Land(), Land(), Land(), Land(), Land(), Land()
]
game_board_size = len(game_board)


def printCellPrefix(position):
    occupying = []
    for player in players:
        if player.position == position and player.money > 0:
            occupying.append(player.name)
    print(" " * (num_players - len(occupying)) + "".join(occupying), end='')
    if len(occupying) > 0:
        print("|", end='')
    else:
        print(" ", end='')


def printGameBoard():
    print("-" * (10 * (num_players + 6)))
    for i in range(10):
        printCellPrefix(i)
        game_board[i].print()
    print("\n")
    for i in range(8):
        printCellPrefix(game_board_size - i - 1)
        game_board[-i - 1].print()
        print(" " * (8 * (num_players + 6)), end="")
        printCellPrefix(i + 10)
        game_board[i + 10].print()
        print("\n")
    for i in range(10):
        printCellPrefix(27 - i)
        game_board[27 - i].print()
    print("")
    print("-" * (10 * (num_players + 6)))


def terminationCheck():

    # ...
    for player in players:
        if(player.money <= 0):
            return False

    return True


def throwDice():
    step = 0
    for i in range(num_dices):
        step += random.randint(1, 6)
    return step


def main():
    global cur_player
    global num_dices
    global cur_round
    global cur_player_idx

    while terminationCheck():
        printGameBoard()
        for player in players:
            player.printAsset()

    # ...
        cur_player_idx = cur_round % 2
        cur_player = players[cur_player_idx]
        print("Player {}'s turn.".format(cur_player.name))
        
        Player.income = 0
        Player.tax_rate = 0.2
        Player.due = 200
        Player.handling_fee_rate = 0
        cur_player.payDue()

        if(cur_player.num_rounds_in_jail == 0):
            response = input("Pay $500 to throw two dice? [y/n]\n")
            while(response != "y" and response != "n"):
                response = input("Pay $500 to throw two dice? [y/n]\n")
        
            if(response == 'y'):
                if(cur_player.money < 525):
                    print("You do not have enough money to throw two dice!")
                else:
                    num_dices = 2
                    Player.income = 0
                    Player.tax_rate = 0
                    Player.due = 500
                    Player.handling_fee_rate = 0.05
                    cur_player.payDue()
            
            point = throwDice()
            print("Points of dice: {}".format(point))
            cur_player.move(point)
            printGameBoard()
            game_board[cur_player.position].stepOn()
        else:
            cur_player.move(0)
        
        cur_round += 1
    
    cur_player_idx = cur_round % 2
    cur_player = players[cur_player_idx]
    print("Game over! winner: {}.".format(cur_player.name))

if __name__ == '__main__':
    main()

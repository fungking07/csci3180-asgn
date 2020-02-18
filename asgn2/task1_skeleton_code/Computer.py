"""
Name: XXX
Student ID: XXX
"""

from utils import *
from Player import Player
import random

class Computer(Player):
    def __init__(self, id, board):
        super(Computer, self).__init__(id, board)

    def nextPut(self):
        """
        This function randomly generates a legal PUT-movement and does the movement on
        the board (by calling board.putPiece()).
        """
        x = random.randint(0, 15)
        while ### TODO:
            x = random.randint(0, 15)
        
        print('{} [Put] (pos): {}'.format( \
            g('Player 1') if self.id == 1 else b('Player 2'), pos2sym(x) ))

        self.board.putPiece(x, self)
        return x

    def nextMove(self):
        """
        This function randomly generates a legal MOVE-movement (s,t) and then does the
        movement on the board (by calling board.movePiece()).
        """
        xs, xt = random.randint(0, 15), random.randint(0, 15)
        while ### TODO:
            xs, xt = random.randint(0, 15), random.randint(0, 15)

        print('{} [Move] (from to): {} {}'.format( \
            g('Player 1') if self.id == 1 else b('Player 2'), pos2sym(xs), pos2sym(xt) ))
        self.board.movePiece(xs, xt, self)
        return xt

    def nextRemove(self, opponent):
        """
        This function randomly generates a legal REMOVE-movement and does REMOVEmovement
        on the board (by calling board.removePiece()).
        """
        
        ### TODO
        
        print('{} [Remove] (pos): {}'.format( \
            g('Player 1') if self.id == 1 else b('Player 2'), pos2sym(x)))
        self.board.removePiece(x, opponent)

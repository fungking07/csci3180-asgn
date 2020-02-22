"""
Name: Lam King Fung
Student ID: 1155108968
"""

from utils import *
from Player import Player

class Human(Player):
    def __init__(self, id, board):
        super(Human, self).__init__(id, board)

    def nextPut(self):
        """
        This function takes a single location input for PUT-movement. It keeps checking
        whether it is a legal PUT-movement until the input is a legal PUT-movement. After
        getting the correct input, it then does the movement on the board (by calling
        board.putPiece()). It returns the position where the piece locates because 
        it might trigger the end of the game.
        """
        valid_flag = True
        while valid_flag:
            x = input('{} [Put] (pos): '.format( \
                g('Player 1') if self.id == 1 else b('Player 2') )).lower().strip()
            if len(x) != 1:
                print('Invalid Put-Movement.')
            else:
                x = sym2pos(x)
                if not self.board.checkPut(x):
                    print('Invalid Put-Movement.')
                else:
                    valid_flag = False
        self.board.putPiece(x, self)
        return x

    def nextMove(self):
        """
        This function takes two location inputs (s, t) for MOVE-movement. It keeps checking
        whether it is a legal MOVE-movement until the input is a legal MOVE-movement.
        After getting the correct input, it then does the movement on the board (by calling
        board.movePiece()). It returns the position to which the piece moves because 
        it might trigger the end of the game.
        """
        valid_flag = True
        while valid_flag:
            x = input('{} [Move] (from to): '.format( \
                g('Player 1') if self.id == 1 else b('Player 2') )).lower().strip().split(' ')

            ### TODO (check the legal input)

        self.board.movePiece(xs, xt, self)
        return xt

    def nextRemove(self, opponent):
        """
        This function takes a location input for REMOVE-movement. It keeps checking whether
        it is a legal REMOVE-movement until the input is a legal REMOVE-movement. After
        getting the correct input, it then does REMOVE-movement on the board (by calling
        board.removePiece()).
        """
        valid_flag = True
        while valid_flag:
            x = input('{} [Remove] (pos): '.format( \
                g('Player 1') if self.id == 1 else b('Player 2') )).lower().strip()
            
            ### TODO

        self.board.removePiece(x, opponent)



"""
Name: Lam King Fung
Student ID: 1155108968
"""

class Player():
    def __init__(self, id, board):
        self.id = id
        self.symbol = '#' if id == 1 else '@' # Player 1: # Player 2: @
        self.board = board

    def get_id(self):
        return self.id

    def get_symbol(self):
        return self.symbol

    def nextPut(self):
        """
        This function takes a single location input for PUT-movement. It keeps checking
        whether it is a legal PUT-movement until the input is a legal PUT-movement. After
        getting the correct input, it then does the movement on the board (by calling
        board.putPiece()).
        """
        return None

    def nextMove(self):
        """
        This function takes two location inputs (s, t) for PUT-movement. It keeps checking
        whether it is a legal MOVE-movement until the input is a legal MOVE-movement.
        After getting the correct input, it then does the movement on the board (by calling
        board.movePiece()).
        """
        return None

    def nextRemove(self, opponent):
        """
        This function takes a location input for REMOVE-movement. It keeps checking whether
        it is a legal REMOVE-movement until the input is a legal REMOVE-movement. After
        getting the correct input, it then does REMOVE-movement on the board (by calling
        board.removePiece()).
        """
        pass

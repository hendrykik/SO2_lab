import random
from studentA import is_game_over

def get_usser_move(board):
    choice = input("Your turn! Give number from 1 to 9: ")
    while true:
        if board[choice + 1] == ' ':
            makeMove(board, "X", choice)
            return
        else:  
            choice = input("This place is already taken! Choose another number: ")
    
def is_player_starting():
    if random.randomint(0, 1) == 0:
        print("Computer is starting")
        return False
    else:
        print("User is starting")
        return True
    
def getBoardCopy(board):
    dupeBoard = []

    for i in board:
        dupeBoard.append(i)
    
    return dupeBoard

def isSpaceFree(board, move):
    return board[move] == ' '

def makeMove(board, letter, move):
    board[move] = letter

def ai_move(board):
    for i in range(1, 10):
        copy = getBoardCopy(board)
        if isSpaceFree(copy, i):
            makeMove(copy, "O", i)
            if is_game_over(copy):
                makeMove(board, "O", i)
            
    for i in range(1, 10):
        copy = getBoardCopy(board)
        if isSpaceFree(copy, i):
            makeMove(copy, "X", i)
            if is_game_over(copy):
                makeMove(board, "O", i)
            
    if isSpaceFree(board, 5):
        makeMove(board, "O", 5)
    
    for i in range(1, 10):
        if isSpaceFree(board, i):
           makeMove(board, "O", i)
            

            

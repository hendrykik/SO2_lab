def print_board(board):
    for i in range(3):
        i = i * 3
        print(board [i], " | ", board [i+1], " | ", board [i+2] )
        if not i==6: print("--------------")
    print("\n\n")


def is_game_over(board):
    j = 0
    for i in range(3):
        if (board[j] != ' ' and board[j] == board[j+1] and board[j+1] == board[j+2]):
            return True
        j = i + 3
        if (board[i] != ' ' and board[i] == board[i+3] and board[i+3] == board[i+6]):
            return True
    if (board[0] != ' ' and board[0] == board[4] and board[4] == board[8]):
        return True
    if (board[2] != ' ' and board[2] == board[4] and board[4] == board[6]):
        return True

    x = 0
    for i in range(9):
        if ( board[i] != ' '):
            x = x + 1
        
    if (x == 9): return True

    return False

def new_board():
    return [' ' for _ in range(9)]

def announce_outcome(board, players_move):
    print_board(board)
    if(players_move == False):
        print("Wygrales")
    else:
        print("Przegrales")

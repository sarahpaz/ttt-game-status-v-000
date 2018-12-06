# Helper Method
def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # First column
    [1, 4, 7], # Second column
    [2, 5, 8], # Third column
    [0, 4, 8], # Top left to bottom right diagonal
    [2, 4, 6] # Top right to bottom left diagonal
]

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
    end
end

def full?(board)
    board.all? do |space|
    space == "X" || space == "O"
    end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
    won?(board) || draw?(board) || full?(board)
end

def winner(board)
    if win_combination = won?(board)
      board[win_combination[0]]
    else
      return nil
  end
end
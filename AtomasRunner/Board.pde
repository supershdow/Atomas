class Board {
  private ArrayList<GamePiece> board;
  private int score;
  
  Board(){
    board = new ArrayList<GamePiece>();
    score = 0;
  }
  
  void addPiece(GamePiece piece, int location){
    board.add(location, piece);
  }
  
  void displayBoard(){
    fill(100);
    rect(0,0,400,400);
    fill(255);
    ellipse(200,200,300,300);
    for (int i = 0; i < board.size(); i++){
      fill(board.get(i).getColor());
      board.get(i).drawPiece((int)(150 * cos(radians((float)(200 * i / board.size())))) + 200, 
        (int)(150 * sin(radians((float)(200 * i / board.size())))) + 200);
    }
  }
  
  void combine(){
    for (int i = 0; i < board.size(); i++)
      if (board.get(i).getValue() == -1)
        if (board.get((i - 1) % board.size()).getValue() == board.get((i + 1) % board.size()).getValue()){
          board.set(i - 1, AtomasRunner.pieces[AtomasRunner.mode][board.get(i).getValue() + 1]);
          board.remove(i);
          board.remove(i);
        }
          
  
  
  
}
}
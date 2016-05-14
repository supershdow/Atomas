class Board {
  private ArrayList<GamePiece> board;
  private int score;
  GamePiece[][] pieces = {{new GamePiece(color(0,0,255), 1, "Chris"), new GamePiece(color(0,0,255), 2, "Josh"), new GamePiece(color(0,0,255), 3, "Ish")}, {}, {}};
  private int maxSize;
  
  Board(){
    board = new ArrayList<GamePiece>();
    score = 0;
    maxSize = 10;
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
      board.get(i).drawPiece((int)(150 * cos(radians((float)(200 * 2 * i / board.size())))) + 200, 
        (int)(150 * sin(radians((float)(200 * 2 * i / board.size())))) + 200);
    }
    fill(0);
    textSize(25);
    text("Score: " + score, 0, 50);
  }
  
  void combine(){
    for (int i = 0; i < board.size(); i++)
      if (board.get(i).getValue() == -1){
        println(i + " " + board.size());
        if (board.size() <= 2)
          break;
        if (i == 0 && board.get((board.size() - 1)).getValue() == board.get((i + 1)).getValue()){
          score += board.get((board.size() - 1)).getValue();
          board.set((board.size() - 1), pieces[AtomasRunner.mode][board.get((board.size() - 1)).getValue()]);
          board.remove(i);
          board.remove(i);
        }
        else if (i == board.size() - 1 && board.get((i - 1)).getValue() == board.get(0).getValue()){
          score += board.get((i - 1)).getValue();
          board.set((i - 1), pieces[AtomasRunner.mode][board.get((i - 1)).getValue()]);
          board.remove(i);
          board.remove(i);
        }
        else if (i > 0 && i < board.size() - 1 && board.get(i - 1).getValue() == board.get((i + 1)).getValue()){
          score += board.get((i - 1)).getValue();
          board.set((i - 1), pieces[AtomasRunner.mode][board.get((i - 1) % board.size()).getValue()]);
          board.remove(i);
          board.remove(i);
        }
      }
  }
  GamePiece selectPiece(){
  if (Math.random() < .2)
    return new GamePiece(color(255,0,0), -1, "+");
  return pieces[AtomasRunner.mode][(int)(Math.random() * pieces[mode].length)];
}

boolean gameOver(){
  return board.size() >= maxSize;
}

}


class Board {
  private ArrayList<GamePiece> board;
  private int score;
  GamePiece[][] pieces;
  private static final int maxSize = 20;

  Board() {
    String[][] names = {{"Chris", "Josh", "Ish", "Nick", "Ray", "Tomer", "Dalton", "Karl", "Wang", "Benji", "Yuya", "Adam", "Arian", "Winston", "Pia", "Patton", "Mitchell", "Uriah", "Daniel", "Skip"}, 
      {" H", "He", "Li", "Be", " B", " C", " N", " O", " F", "Ne", "Na", "Mg", "Al", "Si", " P", "S", "Cl", "Ar", " K", "Ca"}, 
      {"Allen", "Asch", "Bausili", "Berger", "Brooks", "Brown", "Byun", "Cornish", "DeSilva", "Huth", "Ilany", "Kudlash", "Lerohl", "Goldsmith", "McConnell", "Qiu", "Radman", "Reingold", "Seoh", "Weng"}};
    pieces = new GamePiece[3][100];
    for (int i = 0; i < names.length; i++)
      for (int j = 0; j < names[i].length; j++)
        pieces[i][j] = new GamePiece(color(0, 0, 255), j + 1, names[i][j]);
    board = new ArrayList<GamePiece>();
    score = 0;
    
  }

  void addPiece(GamePiece piece, int location) {
    board.add(location, piece);
  }

  int size() {
    return board.size();
  }

  void displayBoard() {
    fill(100);
    rect(0, 0, 600, 600);
    fill(255);
    ellipse(300, 300, 400, 400);
    for (int i = 0; i < board.size(); i++) {
      fill(board.get(i).getColor());
      board.get(i).drawPiece((int)(200 * cos(radians((float)(180 * 2 * i / board.size())))) + 300, 
        (int)(200 * sin(radians((float)(180 * 2 * i / board.size())))) + 300);
    }
    fill(0);
    textSize(25);
    text("Score: " + score, 0, 50);
  }

  void combine() {
    int chains;
    for (int i = 0; i < board.size(); i++)
      if (board.get(i).getValue() == -1) {
        if (board.size() <= 2)
          break;
        int left = i - 1;
        int right = i + 1;
        if (left < 0)
          left += board.size();
        if (right >= board.size())
          right -= board.size();
        if (left != right && board.get(left).getValue() == board.get(right).getValue() && board.get(left).getValue() != -1 && board.get(right).getValue() != -1) {
          chains = chain(left, right);
          //println(chains);
          score += (int)(Math.pow(chains + 1, 2));
          board.set(i, pieces[mode][combineValue(chains, i) - 1]);
          for (int j = 1; j <= chains && board.size() > 2; j++) {
            ding.play();
            //println((i + j) % board.size() + " "  + (i - j + board.size()) % board.size() + " " + board.size());
            board.remove((i + j) % board.size());
            //println(i + " " + j + " " + board.size());
            if (board.size() > 1 && (i + j) % board.size() < (i - j + board.size()) % board.size())
              board.remove((i - j + board.size() - 1) % board.size());
            else if (board.size() > 1)
              board.remove((i - j + board.size()) % board.size());
          }
        }
      }
  }

  int combineValue(int chains, int center) {
    int val = 0;
    val = board.get((++center + board.size()) % board.size()).getValue();

    for (int i = 1; i <= chains; i++)
      if (board.get(((center + i) % board.size())).getValue() > val)
        val = board.get(((center + i) % board.size())).getValue() + 1;
      else
        val++;
    return val;
  }

  int chain(int left, int right) {
    int chain = 0;
    while (left < 0)
      left += board.size();
    while (right >= board.size())
      right -= board.size();
    while (board.size() > 2 && board.get(left).getValue() == board.get(right).getValue() && right != left && board.get(left).getValue() != -1 && board.get(right).getValue() != -1) {
      left--;
      right++;
      chain++;
      while (left < 0)
        left += board.size();
      while (right >= board.size())
        right -= board.size();
    }
    return chain;
  }

  GamePiece selectPiece() {
    if (Math.random() < .4)
      return new GamePiece(color(255, 0, 0), -1, "+");
    return pieces[AtomasRunner.mode][(int)(Math.random() * score / 5) + (int)(score/10)];
  }

  boolean gameOver() {
    return board.size() >= maxSize;
  }
}
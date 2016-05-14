class GamePiece {
  private color pieceColor;
  private int pieceValue;
  private String description;

  GamePiece(color col, int value, String describe) {
    pieceColor = col;
    pieceValue = value;
    description = describe;
  }

  color getColor() {
    return pieceColor;
  }

  int getValue() {
    return pieceValue;
  }

  String getDescription() {
    return description;
  }

  void drawPiece(int locX, int locY) {
    ellipse(locX, locY, 60, 60);
    fill(0,0,0);
    textSize(12);
    if (pieceValue != -1) {
      fill(255, 255, 255);
      text(description, locX - 12, locY - 2);
      text(""+ pieceValue, locX - 7, locY + 9);
    } else {
      text(description, locX - 5, locY + 2);
    }
  }

  void addDescription(String add) {
    description += add;
  }
}
Board board;
static int mode;
boolean started;
GamePiece add;


void setup() {
  size(600, 600);
  fill(200);
  rect(0, 0, 200, 600);
  fill(0);
  text("Ultimate Mode", 20, 200);
  fill(150);
  rect(200, 0, 200, 600);
  fill(0);
  text("Chemistry Mode", 220, 200);
  fill(200);
  rect(400, 0, 200, 600);
  fill(0);
  text("Teacher Mode", 420, 200);
  started = false;
  mode = -1;
}

void draw() {
  if (mode != -1) {
    clear();
    if (!started) {
      startGame();
      started = true;
    } else {
      if (add == null)
        add = board.selectPiece();
      board.combine();
      board.displayBoard();
      fill(add.getColor());
      add.drawPiece(300, 300);
      if (board.gameOver())
        setup();
    }
  }
}

void startGame() {
  fill(100);
  rect(0, 0, 600, 600);
  fill(255);
  ellipse(300, 300, 400, 400);
  board = new Board();
  fill(255, 0, 0);
  board.addPiece(board.pieces[mode][0], 0);
  board.displayBoard();
}



void mouseClicked() {
  if (mode == -1) {
    if (mouseX < 200)
      mode = 0;
    else if (200 < mouseX && mouseX < 400)
      mode = 1;
    else if (mouseX > 400)
      mode = 2;
  } else {
    int sections = board.size();
    if (board.size() <= 2)
      board.addPiece(add, board.size());
    else {
      for (int i = 1; i <= sections; i++) {
        float p2y = (200 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 300;
        float p3y = (200 * sin(radians((float)(180 * 2 * i / board.size())))) + 300;
        float p3x = (200 * cos(radians((float)(180 * 2 * i / board.size())))) + 300;
        float p2x = (200 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 300;
        float px = mouseX;
        float py = mouseY;
        float p1x = 300;
        float p1y = 300;
        float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
          ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
          ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float gamma = 1.0f - alpha - beta;
        if (alpha > 0 && beta > 0 && gamma > 0) {
          board.addPiece(add, i);
          break;
        }
      }
    }
    add = null;
  }
}
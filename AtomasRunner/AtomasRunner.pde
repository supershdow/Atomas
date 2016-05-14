Board board;
static int mode;
boolean started;
GamePiece add;


void setup() {
  size(400, 400);
  fill(200);
  rect(0, 0, 133, 400);
  fill(0);
  text("Ultimate Mode", 20, 200);
  fill(150);
  rect(133, 0, 133, 400);
  fill(0);
  text("Chemistry Mode", 155, 200);
  fill(200);
  rect(266, 0, 133, 400);
  fill(0);
  text("Teacher Mode", 286, 200);
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
      add.drawPiece(200, 200);
      if (board.gameOver())
        setup();
    }
  }
}

void startGame() {
  fill(100);
  rect(0, 0, 400, 400);
  fill(255);
  ellipse(200, 200, 300, 300);
  board = new Board();
  fill(255, 0, 0);
  board.addPiece(board.pieces[mode][0], 0);
  board.displayBoard();
}



void mouseClicked() {
  if (mode == -1) {
    if (mouseX < 133)
      mode = 0;
    else if (133 < mouseX && mouseX < 266)
      mode = 1;
    else if (mouseX > 266)
      mode = 2;
  } else {
    int sections = board.size();
    if (board.size() <= 2)
      board.addPiece(add, board.size());
    else {

      for (int i = 1; i <= sections; i++)
        if (mouseX >(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX < (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY > (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY < (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        } else if (mouseX <(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX > (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY > (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY < (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        } else if (mouseX >(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX < (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY < (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY > (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        } else if (mouseX <(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX > (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY < (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY > (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        }
        else if (mouseX >(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX > (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY < (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY > (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        }
        else if (mouseX <(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX < (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY < (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY > (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        }
        else if (mouseX <(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX > (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY < (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY < (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        }
        else if (mouseX <(int)(150 * cos(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseX > (int)(150 * cos(radians((float)(180 * 2 * i / board.size())))) + 200
          && mouseY > (int)(150 * sin(radians((float)(180 * 2 * (i-1) / board.size())))) + 200 && mouseY > (int)(150 * sin(radians((float)(180 * 2 * i / board.size())))) + 200) {
          board.addPiece(add, i);
          break;
        }
    }
    add = null;
  }
}
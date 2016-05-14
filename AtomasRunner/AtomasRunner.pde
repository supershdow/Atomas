

Board board;
static int mode;
static GamePiece[][] pieces = {{new GamePiece(blue(), 1, "Chris")}, {}, {}};
boolean started;


void setup(){
  size(400,400);
  fill(200);
  rect(0,0,133,400);
  fill(0);
  text("Ultimate Mode", 20,200);
  fill(150);
  rect(133,0,133,400);
  fill(0);
  text("Chemistry Mode", 155,200);
  fill(200);
  rect(266,0,133,400);
  fill(0);
  text("Teacher Mode", 286,200);
  started = false;
  mode = -1;
}

void draw(){
  if (mode != -1){
    clear();
    if (!started){
      startGame();
      started = true;
    }
    board.displayBoard();
  }
}

void startGame(){
  fill(100);
  rect(0,0,400,400);
  fill(255);
  ellipse(200,200,300,300);
  board = new Board();
  fill(255,0,0);
  board.addPiece(pieces[mode][0],0);
  board.displayBoard();
}

GamePiece selectPiece(){
  if (Math.random() < .2)
    return new GamePiece(red(), -1, "+");
  return pieces[mode][(int)(Math.random() * pieces[mode].length)];
}

void mouseClicked(){
  if (mode == -1){
    if (mouseX < 133)
      mode = 0;
    else if (133 < mouseX && mouseX < 266)
      mode = 1;
    else if (mouseX > 266)
      mode = 2;
    
  }
}
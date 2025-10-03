GameManager gm;
PFont font;

void setup(){
  size(800,600);
  frameRate(60);
  font = createFont("MS Gothic", 16);
  textFont(font);
  gm = new GameManager();
  gm.init();
  
}

void draw(){
  background(200);
  gm.input();
  gm.update();
  gm.draw();
}

Vertex vertex;
GameParameter params;
PFont font;
boolean left;
boolean right;
boolean up;
boolean down;

void setup(){
  size(800,600);
  frameRate(60);
  font = createFont("MS Gothic", 16);
  textFont(font);
  params = new GameParameter();
  vertex = new Vertex(params);
}
void draw(){
  background(200);
  vertex.input(left,right,up,down);
  vertex.update();
  vertex.draw();
} 


void keyPressed() {
  if (keyCode == LEFT)  left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == UP)    up = true;
  if (keyCode == DOWN)  down = true;
}

void keyReleased() {
  if (keyCode == LEFT)  left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == UP)    up = false;
  if (keyCode == DOWN)  down = false;
}
  
class GameParameter{
float horizon;
float roadCenter;
float speed;
float speedLimit;//スピード限界値
float roadWidthTop, roadWidthBottom;
float player_x, player_y,player_Fx, player_Fy;
float spdMin,spdMax;//現在のギアでのスピード上限下限

GameParameter(){
    horizon = height*0.3;//地平線
    roadCenter = width/2;
    speed = 0;
    speedLimit = 200;
    roadWidthTop = 50; //地平線からくる道路の幅
    roadWidthBottom = 400; //画面下端の道路の幅
    player_Fx = roadCenter;
    player_Fy = height*0.8;
    spdMin = 0;
    spdMax = 200;
}
}
  
/*外部から与えられる消失点Vに対して、x=n,y=0で定義される近点Npで形成されるパース線VNp
消失点と近点がそれぞれx=0のとき(初期位置)の点V0,Oでの線分VO上に指定する任意の点から引かれる垂線
その二線の交点を導出するクラス
目的：任意のy座標指定でパース線上の頂点を返すクラス*/
class Vertex{
  GameParameter params;
  float vx;    // 消失点 x（←→キーで移動）
  float vy;    // 消失点 y（固定）
  float x0;          // 法線ベクトル x座標（画面中央）
  PVector origin;    // 原点 O（画面下中央）PVector型の変数は座標データのオブジェクト
  PVector van;    //消失点
  PVector Ver;    // 目的の頂点(スピード連動で移動させたい)
  PVector Np; //NearPoint 近点。画面下とパース線の交点
  
  //ここまで引数にしたい ！！可変であること！！
  
  Vertex(GameParameter params) {
    this.params = params;
    vy = 0;//これが引数になる予定
    vx = 0;
    van = new PVector(vx,params.horizon);//vanishingPoint,消失点
    origin = new PVector(width/2, height); // 原点
    x0 = width/2;                           // 法線は画面中央
    Np = new PVector(origin.x,origin.y); // 初期近点
    Ver = new PVector();//戻り値
  }
  void update() {
    // パース線 VNp の傾き
    float a = (van.y - Np.y) / (van.x - Np.x);
    //  中点に追従（必要に応じて）
    van.x = (origin.x + vx);
    Np.x = (origin.x + vx/2);
    Ver.y = (origin.y + vy);
    Ver.x = (Ver.y - van.y) / a + van.x;
    
  }
  void draw() {
    // 上底頂点
    //PVector Ver = PVector(topMid.x + Ltop/2, topMid.y);

    // 水平線（消失点 y）
    stroke(150, 0, 0);
    line(0, params.horizon, width, params.horizon);
    
    // 原点から消失点への線
    stroke(0, 150, 0);
    line(origin.x, origin.y, van.x, van.y);
    
    //消失点と近点への線
    stroke(150, 150, 0);
    line(Np.x, Np.y, van.x, van.y);
    
    // 法線ベクトル（画面中央）
    stroke(0, 0, 150);
    line(x0, 0, x0, height);
    
    // 消失点
    fill(255, 0, 0);
    ellipse(van.x, van.y, 10, 10);
    
    // 近点
    fill(255, 150, 0);
    ellipse(Np.x, Np.y, 10, 10);
    
    // 引数vy
    fill(255, 0, 255);
    ellipse(x0, Ver.y, 10, 10);
    
    //戻り値Ver
    fill(0, 255, 255);
    ellipse(Ver.x, Ver.y, 10, 10);

    // デバッグ表示
    fill(0);
    text("消失点 van.x = " + nf(van.x,1,2) +", 近点 Np.x = " + nf(Np.x,1,2) , 20, 20);
    text("入力値 vx = " + nf(vx,1,2) + ", 入力値 vy = " + nf(Ver.y,1,2)+"出力 Ver.x ="+ nf(Ver.x,1,2), 20, 40);
  }
  void input(boolean left,boolean right,boolean up,boolean down){
    // 消失点左右移動
    if (left)  vx -= 1;
    if (right) vx += 1;

    // 上底中点上下移動
    if (up)   vy -= 1 ;
    if (down)  vy += 1;
  }
}

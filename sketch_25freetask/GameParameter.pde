class GameParameter{
float horizon;
float roadCenter;
float speed;
float speedLimit;//スピード限界値
float diffSpeed;//スピード変化量
float roadWidthTop, roadWidthBottom;
float player_x, player_y,player_Fx, player_Fy;
float spdMin,spdMax;//現在のギアでのスピード上限下限
float vx;    // 消失点 x（←→キーで移動）
float vy;    // 消失点 y（固定）
float x0;          // 法線ベクトル x座標（画面中央）
PVector origin;    // 原点 O（画面下中央）PVector型の変数は座標データのオブジェクト
PVector van;    //消失点
PVector Np; //NearPoint 近点。画面下とパース線の交点
  

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
  void input(boolean left,boolean right,boolean up,boolean down){
    // 消失点左右移動
    if (left)  {
      vx -= 1;
      player_Fx -=1;
    }
    if (right) {
      vx += 1;
      player_Fx += 1;
    }
      
    // 上底中点上下移動
    if (up)   {
      vy -= 1;
      player_Fy -= 1;
      diffSpeed = 1;
    }else if(down == false){
      diffSpeed = 0;
      
    }
    if (down)  {
      vy += 1;
      player_Fy += 1;
      diffSpeed = -1;
    }
}
  void update(){

  }
}

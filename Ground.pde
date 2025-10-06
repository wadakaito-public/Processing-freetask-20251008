class Ground {
  GameParameter params;

  
  //コンストラクタ.GameManagerのパラメータをメンバ変数に格納
  Ground(GameParameter params){
    this.params = params;

  }
  
  void update() {
  
  }
  void draw() {
  
  pushStyle();    //地面
  fill(34,139,34);//とりあえず緑
  noStroke();
  rect(0,params.horizon,width,height-params.horizon);
  popStyle();
  
  //中心線
  
  }
}

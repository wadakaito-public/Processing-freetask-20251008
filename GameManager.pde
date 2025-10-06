class GameManager{
  GameParameter params;
  Car player;
  Ground ground;
  RoadLine line;
  Sky sky;
  UserInterface ui;
  

  void init(){//初期化、インスタンスの生成

    params = new GameParameter();
    player = new Car(params);//x,y,speed
    ground = new Ground(params);//このインスタンスを渡す
    line = new RoadLine(params);
    sky = new Sky();
    ui = new UserInterface(params);
  }
  
  //インスタンスに対する更新
  void update(){
    params.update();
    player.update(params);
    ground.update();
    line.update();
    sky.update();
    

  }
  
  //インスタンス描画
  void draw(){
    sky.draw();
    ground.draw();
    line.draw();
    player.draw();
    ui.draw();
  }
  
  //自機制御
  void input(){
    boolean left = keyPressed && keyCode == LEFT;
    boolean right = keyPressed && keyCode == RIGHT;
    boolean up = keyPressed && keyCode == UP;
    boolean down = keyPressed && keyCode == DOWN;
    params.input(left,right,up,down);
  }
  
  
}

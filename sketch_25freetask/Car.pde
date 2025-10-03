class Car{
  GameParameter params;
  PVector[] body;  //車体の座標データ
  PVector[] roof;  //屋根
  PVector[] tire; //タイヤ
  float carWidth;
  float carHeight;
  
  Car(GameParameter params){
    this.params = params;
    this.carWidth = params.carWidth;
    this.carHeight = params.carHeight;
    
    body = new PVector[9];
    body[0] = new PVector ( params.player_Fx, params.player_Fy - carHeight*((float)3/10) );
    body[1] = new PVector ( params.player_Fx - carWidth*((float)9/20), params.player_Fy - carHeight*((float)3/10) );
    body[2] = new PVector ( params.player_Fx - carWidth*((float)1/2), params.player_Fy - carHeight*((float)2/10) );
    body[3] = new PVector ( params.player_Fx - carWidth*((float)1/2), params.player_Fy + carHeight*((float)2/10) );
    body[4] = new PVector ( params.player_Fx - carWidth*((float)9/20), params.player_Fy + carHeight*((float)3/10) );
    body[5] = new PVector ( params.player_Fx + carWidth*((float)9/20), params.player_Fy + carHeight*((float)3/10) );
    body[6] = new PVector ( params.player_Fx + carWidth*((float)1/2), params.player_Fy + carHeight*((float)2/10) );
    body[7] = new PVector ( params.player_Fx + carWidth*((float)1/2), params.player_Fy - carHeight*((float)2/10) );
    body[8] = new PVector ( params.player_Fx + carWidth*((float)9/20), params.player_Fy - carHeight*((float)3/10) );
    
    roof = new PVector[4];
    roof[0] = new PVector ( params.player_Fx - carWidth*((float)7/20), params.player_Fy - carHeight*((float)3/10) );
    roof[1] = new PVector ( params.player_Fx - carWidth*((float)6/20), params.player_Fy - carHeight*((float)5/10) );
    roof[2] = new PVector ( params.player_Fx + carWidth*((float)6/20), params.player_Fy - carHeight*((float)5/10) );
    roof[3] = new PVector ( params.player_Fx + carWidth*((float)7/20), params.player_Fy - carHeight*((float)3/10) );
    
  }
  void update(GameParameter params) { 
    if(params.speed + params.diffSpeed >= params.spdMax) params.speed = params.spdMax;
      else if(params.speed + params.diffSpeed <= params.spdMin) params.speed = params.spdMin;
        else params.speed += params.diffSpeed;
  }
  void draw() {
    
    //rect(params.player_Fx-40/2,params.player_Fy,40,40);


  
    fill(47,79,79);
    //タイヤ
    rect(params.player_Fx - carWidth*((float)1/2), params.player_Fy + carHeight*((float)1/10), carWidth*((float)2/20), carHeight*((float)4/10));
    rect(params.player_Fx + carWidth*((float)8/20), params.player_Fy + carHeight*((float)1/10), carWidth*((float)2/20), carHeight*((float)4/10));
    
  beginShape();
  fill(255, 0, 0);
  for (int i=0; i<body.length; i++) {
    PVector v = body[i].copy();
    if (v.x < 0) v.y =v.y * params.leftScale;   // 左側
    else if (v.x > 0) v.y= v.y * params.rightScale; // 右側
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
  
  }
}
    

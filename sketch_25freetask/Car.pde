class Car{
  GameParameter params;
  PVector[] body;  //車体の座標データ
  PVector[] roof;  //屋根
  PVector[] tire; //タイヤ
  PVector[] tire2; 
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
    
    tire = new PVector[4];
    tire[0] = new PVector ( params.player_Fx - carWidth*(1f/2) , params.player_Fy + carHeight*(1f/10) );
    tire[1] = new PVector ( params.player_Fx - carWidth*(8f/20) , params.player_Fy + carHeight*(1f/10) );
    tire[2] = new PVector ( params.player_Fx - carWidth*(8f/20) , params.player_Fy + carHeight*(5f/10) );
    tire[3] = new PVector ( params.player_Fx - carWidth*(1f/2) , params.player_Fy + carHeight*(5f/10) );
    
    tire2 = new PVector[4];
    tire2[0] = new PVector ( params.player_Fx + carWidth*(8f/20), params.player_Fy + carHeight*(1f/10) );
    tire2[1] = new PVector ( params.player_Fx + carWidth*(10f/20) , params.player_Fy + carHeight*(1f/10) );
    tire2[2] = new PVector ( params.player_Fx + carWidth*(10f/20) , params.player_Fy + carHeight*(5f/10) );
    tire2[3] = new PVector ( params.player_Fx + carWidth*(8f/20) , params.player_Fy + carHeight*(5f/10) );

}
  
  void update(GameParameter params) { 
    if(params.speed + params.diffSpeed >= params.spdMax) params.speed = params.spdMax;
      else if(params.speed + params.diffSpeed <= params.spdMin) params.speed = params.spdMin;
        else params.speed += params.diffSpeed;
  }
  
  void draw() {
    fill(47,79,79);
    //タイヤ
    beginShape();
    for (int i=0; i<tire.length; i++) {
      PVector v = loadVector(tire[i]);
      vertex(v.x, v.y);
      }
    endShape(CLOSE);
    
    beginShape();
    for (int i=0; i<tire2.length; i++) {
      PVector v = loadVector(tire2[i]);
      vertex(v.x, v.y);
      }
    endShape(CLOSE);
    
    beginShape();
    fill(255, 0, 0);
    for (int i=0; i<body.length; i++) {
      PVector v = loadVector(body[i]);
      vertex(v.x, v.y);
      }
    endShape(CLOSE);
    //屋根
    beginShape();
    fill(255, 0, 0);
    for (int i=0; i<roof.length; i++) {
      PVector v = loadVector(roof[i]);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }

  //座標の指定要素をハンドル入力に合わせて補正
  PVector loadVector (PVector input){
      PVector v = input.copy();
      if (v.x < params.player_Fx) {
        if (v.y <params.player_Fy) {
          v.y =v.y * params.downScale;
        }else if (v.y > params.player_Fy) {
          v.y = v.y * params.upScale;
        }
      }
      else if (v.x > params.player_Fx) { 
        if (v.y <params.player_Fy) {
          v.y =v.y * params.upScale;
        }else if (v.y > params.player_Fy) {
          v.y = v.y * params.downScale;
        }
      }
      return v;
   }
}

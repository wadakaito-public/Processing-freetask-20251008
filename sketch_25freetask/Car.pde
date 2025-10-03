class Car{
  GameParameter params;

  
  Car(GameParameter params){
    this.params = params; 
  }
  void update(GameParameter params) { 
    if(params.speed + params.diffSpeed >= params.spdMax) params.speed = params.spdMax;
      else if(params.speed + params.diffSpeed <= params.spdMin) params.speed = params.spdMin;
        else params.speed += params.diffSpeed;
  }
  void draw() {
    fill(255, 0, 0);
    rect(params.player_Fx-40/2,params.player_Fy,40,40);
  
  }
  
  
    
  }
    

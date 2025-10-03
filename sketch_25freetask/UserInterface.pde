class UserInterface{
 GameParameter params;
 
  UserInterface(GameParameter params){
  this.params = params;
  }
  void draw(){
    text("speed = "+params.speed,120,150);
}}

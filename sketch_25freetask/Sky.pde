class Sky {
  GameParameter params;
  Sky(GameParameter params){
  this.params = params;
  }
  void update() { }
  void draw() {
  fill(0,191,255);
  noStroke();
  rect(0,0,width,params.horizon);
}
}

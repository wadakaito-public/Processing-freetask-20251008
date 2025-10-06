class RoadLine{
  GameParameter params;
  Vertex ver;
  ArrayList<Float> ys;
  
  RoadLine(GameParameter params) {
    this.params = params;
    this.ver = new Vertex(params);
  
    //可変長配列ys 描画のために一定間隔のy座標で区切る
    ys = new ArrayList<Float>();
    for(float y = params.horizon ; y < height  ; y += 40){
    ys.add(y);}

  }
  
  void update() {
    //要素番号[i]の値をセット(現在スピードを入れる)
    //順次実行されるので、スピードが0以上の時は、yが下にずれていく
    for(int i=0; i<ys.size(); i++){
      ys.set(i,ys.get(i) + params.speed/30);
    }
    
    //ysが画面下に到達したら、リストから削除して水平線上に新規追加
    if (ys.get(0) > height+50) {
      ys.remove(0);
    }
    float lastY = ys.get(ys.size()-1);
    if (lastY >=params.horizon + 40){
      ys.add(lastY - 40); // 上の方に等間隔で追加
    }
  }
  void draw() {
    //道路
    beginShape();
    fill(102,102,102);
    PVector r1 = ver.getVertex( params.roadCenter + params.vx , params.horizon );
    PVector r2 = ver.getVertex( params.roadCenter + params.vx+width/1.2 , height );
    PVector r3 = ver.getVertex( params.roadCenter + params.vx-width/1.2 , height );
    vertex(r1.x,r1.y);
    vertex(r2.x,r2.y);
    vertex(r3.x,r3.y);
    endShape(CLOSE);
    
    
    for (int i = 0; i < ys.size(); i++){
      float lineWidth = 10;
      float lineHeight = 40;
      PVector p = ver.getVertex( params.roadCenter + params.vx , (ys.get(i)) );
      //中央線の頂点a,b,c,d
      
      /*PVector a = new PVecter( p.x-
      PVector b = new PVecter(
      PVector c = new PVecter(
      PVector d = new PVecter(*/
      fill(0, 255, 255);
      ellipse(p.x,p.y, 10, 10);
    }
    
    
  }
}

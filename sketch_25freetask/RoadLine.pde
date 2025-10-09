class RoadLine{
  GameParameter params;
  Vertex ver;
  ArrayList<Float> ys;
  
  RoadLine(GameParameter params) {
    this.params = params;
    this.ver = new Vertex(params);
    ys = new ArrayList<Float>();
    //可変長配列ys 描画のために一定間隔のy座標で区切る
    for(float y = params.horizon ; y < height  ; y += 20){
    ys.add(y);}

  }
  
  void update() {
    //要素番号[i]の値をセット(現在スピードを入れる)
    //順次実行されるので、スピードが0以上の時は、yが下にずれていく
    for(int i=0; i<ys.size(); i++){
      ys.set(i,ys.get(i) + params.speed/30);
    }
    
    //ysが画面下に到達したら、リストから削除して水平線上に新規追加
     while (!ys.isEmpty() && ys.get(0) > height) {
        ys.remove(0);
    }
    
    // 新規追加は画面上端(horizon)からスタート
    while (!ys.isEmpty() && ys.get(ys.size()-1) >params.horizon) {
        float newY = ys.get(ys.size()-1) - 20;
        if (newY >= params.horizon){ ys.add(newY);
        newY -=20;}
        else break;
    }
  }
  void draw() {
    //道路
    beginShape();
    fill(102,102,102);
    PVector r1 = ver.getVertex( params.roadCenter + params.vx , params.horizon , 0);
    PVector r2 = ver.getVertex( params.roadCenter + params.vx , height , -(width*0.2) + params.vx/2);
    PVector r3 = ver.getVertex( params.roadCenter + params.vx , height , +(width*0.2) + params.vx/2);
    vertex(r1.x,r1.y);
    vertex(r2.x,r2.y);
    vertex(r3.x,r3.y);
    endShape(CLOSE);
    
    //memo
    //傾きを返すメソッドをVertexクラスに追加して、その傾きを元に+y方向の座標を算出すればいいのでは？？？
    for (int i = 0; i < ys.size()-1; i++){
      float lineWidth = 40;
      float lineHeight = 30;
      float center = params.origin.x-((r2.x)+(r3.x))/2;
      PVector p = ver.getVertex( params.roadCenter + params.vx , (ys.get(i)) , +center/2 );
      //中央線の頂点a,b,c,d
      //println(Np);
      //println(params.horizon);
      //println(params.vx);
      
      float slope = ver.getSlope( params.roadCenter + params.vx , (ys.get(i)) ,-(lineWidth/2));
      PVector a = ver.getVertex( params.roadCenter + params.vx , (ys.get(i)) ,(lineWidth/2) +center/2 );
      PVector b = ver.getVertex( params.roadCenter + params.vx , (ys.get(i)) ,-(lineWidth/2) +center/2 );
      PVector c = ver.getVertex( params.roadCenter + params.vx , ys.get(i)+((ys.get(i+1) - ys.get(i))/2) , -(lineWidth/2) +center/2 );
      PVector d = ver.getVertex( params.roadCenter + params.vx , ys.get(i)+((ys.get(i+1) - ys.get(i))/2) ,(lineWidth/2) +center/2 );
      beginShape();
      fill(255, 255, 255);
      vertex(a.x , a.y );//red
      vertex(b.x , b.y );//blue
      vertex(c.x , c.y );//green
      vertex(d.x , d.y );//yellow
      endShape(CLOSE);
      
      /*デバッグ表示*/
      fill(0, 255, 255);
      ellipse(p.x,p.y, 10, 10);
      fill(0,255,0);
      ellipse(a.x,a.y,5,5);
      fill(255,0,0);
      ellipse(b.x,b.y,5,5);
      fill(0,0,255);
      ellipse(c.x,c.y,5,5);
      fill(255,255,0);
      ellipse(d.x,d.y,5,5);  
      fill(0,0,0);
      ellipse(params.Np.x,params.Np.y,5,5);
    }
  }
}

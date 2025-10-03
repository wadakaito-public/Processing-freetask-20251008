class RoadLine {

  GameParameter params;
  Vertex ver;
  ArrayList<Float> ys;

  float minSpacing = 10;   // 上の方の最小間隔
  float maxSpacing = 300;  // 下の方の最大間隔

  RoadLine(GameParameter params) {
    this.params = params;
    this.ver = new Vertex(params);

    ys = new ArrayList<Float>();
    float y = params.horizon;
    
    // 最初は全て密に配置
    while (y < height) {
      ys.add(y);
      y += minSpacing;  
    }
  }

  void update() {
    if (params.speed > 0) {
      for (int i = 0; i < ys.size(); i++) {
        // yに応じて増分を変える（下ほど大きく）
        float t = (ys.get(i) - params.horizon) / (height - params.horizon); // 0~1
        float speedY = lerp(params.speed/60.0, params.speed/10.0, t); // 上はゆっくり、下は速く
        ys.set(i, ys.get(i) + speedY);
      }

      // 下に行った点は削除して上に追加
      for (int i = 0; i < ys.size(); i++) {
        if (ys.get(i) > height + 10) {
          ys.remove(i);
          ys.add(0, params.horizon);
        }
      }
    }
  }

  void draw() {
    for (int i = 0; i < ys.size(); i++) {
      PVector p = ver.getVertex(params.roadCenter, ys.get(i));
      fill(0, 255, 255);
      ellipse(p.x, p.y, 10, 10);
    }
  }
}

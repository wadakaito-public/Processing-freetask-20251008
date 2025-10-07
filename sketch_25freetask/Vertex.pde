/*外部から与えられる消失点Vに対して、x=n,y=0で定義される近点Npで形成されるパース線VNp
消失点と近点がそれぞれx=0のとき(初期位置)の点V0,Oでの線分VO上に指定する任意の点から引かれる垂線
その二線の交点を導出するクラス
目的：任意のy座標指定でパース線上の頂点を返すクラス*/

class Vertex{
  GameParameter params;
  float vx;    // 引数
  float vy;    // 引数
  float x0;          // 法線ベクトル x座標（画面中央）
  PVector origin;    // 原点 O（画面下中央）PVector型の変数は座標データのオブジェクト
  PVector van;    //消失点
  PVector Ver;    // 目的の頂点(スピード連動で移動させたい)
  PVector Np; //NearPoint 近点。画面下とパース線の交点
  
  Vertex(GameParameter params) {
    this.params = params;
    vy = 0;//これが引数になる予定
    vx = 0;
    van = new PVector(vx,params.horizon);//vanishingPoint,消失点
    origin = new PVector(width/2, height); // 原点
    x0 = width/2;                           // 法線は画面中央
    Np = new PVector(origin.x,origin.y); // 初期近点
    Ver = new PVector();//戻り値
  }
  void update(float vx,float vy,float NpDiff) {
    van.x = (origin.x + vx);
    Np.x = (origin.x + vx/2 + NpDiff);
    // パース線 VNp の傾き
    float a = (van.y - Np.y) / (van.x - Np.x);
    Ver.y = (vy);
    Ver.x = (Ver.y - van.y) / a + van.x;
      //println("a=" + a + " van=" + van + " Np=" + Np + " Ver=" + Ver);
      //println("原点origin"+origin+"引数 vx= "+vx+"引数 vy= "+vy +params.horizon);
  }
  
  //交点座標 getVertex(消失点のx座標，任意のy座標, 近点Npの補正(初期は原点))
  PVector getVertex(float vx,float vy,float NpDiff){
    update(vx-origin.x,vy,NpDiff);
    return Ver.copy();
  }


}

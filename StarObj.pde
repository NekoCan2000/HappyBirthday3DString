class Star {
  public PVector position;//位置
  public PVector velocity;//移動ベクトル
  public final PVector g = new PVector(0, 2);//重力
  public final float size;//大きさ
  private float r = 0;//現在の回転角
  private float rotating;//回転量
  private final PVector[] points = new PVector[5];//頂点
  
  public Star(float Size) {
    size = Size;
    int rad = 126;//始まりが上になるようにするおまじないだったかな126
    float r;
    for (int i=0; i<5; i++) {
      r = radians((rad += 144)%360);//144 = (360/5)*2; = 頂点の角度を1個飛ばしでつなぐ
      points[i] = new PVector(size * cos(r), size * sin(r));
    }
    reset();
  }
  
  public void reset(){
    r = 0;
    //回転量設定
    rotating = random(-0.3f, 0.3f);
  }

  public void update() {
    position.add(velocity.add(g));//重力をかける

    pushMatrix();
    translate(position.x, position.y);
    rotate(r+=rotating);
    strokeWeight(size/5);
    beginShape();
    for (int i=0; i<points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}

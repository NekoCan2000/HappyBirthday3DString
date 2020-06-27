class Donut extends Font { //バウムクーヘン型を作るクラス
  int radian, rad = 0;
  PVector[] outside, inside;
  float rotateZ = 0;
  int up = 0;//表示速度
  //大きさ,位置,幅,最大角度
  Donut(float s, PVector p, float w, int maxRadian, float r, int up) {
    super(s, p);
    radian = maxRadian;
    this.up = up;
    rotateZ = radians(r);

    leng = w;

    outside = new PVector[maxRadian];
    inside = new PVector[maxRadian];
    float x, y, z = leng/2;
    for (int deg=0; deg<maxRadian; deg++) {
      float radi = radians(deg);
      x = sin(radi);
      y = cos(radi);
      outside[deg] = new PVector(x * size, y * size, z);
      inside[deg] =  new PVector(x * (size - leng), y * (size - leng), z);
    }
  }
  
  Donut(float s, PVector p, float w, int maxRadian, float r) {
    this(s, p, w, maxRadian, r, 1);
  }
  
  Donut(float s, PVector p, float w, int maxRadian, int up) {
    this(s, p, w, maxRadian, 0, up);
  }
  
  protected void Draw() {
    rotateZ(rotateZ);
    //外側カーブ
    beginShape(QUAD_STRIP);
    for (int deg = 0; deg < rad; deg += 1) {
      vertex(outside[deg].x, outside[deg].y, outside[deg].z);
      vertex(outside[deg].x, outside[deg].y, -outside[deg].z);
    }
    endShape();

    //内側カーブ
    beginShape(QUAD_STRIP);
    for (int deg = 0; deg < rad; deg += 1) {
      vertex(inside[deg].x, inside[deg].y, inside[deg].z);
      vertex(inside[deg].x, inside[deg].y, -inside[deg].z);
    }
    endShape();

    //バウムクーヘンの層が見える部分(手前)(奥)
    for (int i = -1; i<=1; i+=2) {
      beginShape(TRIANGLE_STRIP);
      for (int deg = 0; deg < rad; deg += 1) {
        vertex(outside[deg].x, outside[deg].y, outside[deg].z * i);
        vertex(inside[deg].x, inside[deg].y, inside[deg].z * i);
      }
      endShape();
    }

    //蓋はじめ
    beginShape();
    vertex(outside[0].x, outside[0].y, outside[0].z);
    vertex(outside[0].x, outside[0].y, -outside[0].z);
    vertex(inside[0].x, inside[0].y, -inside[0].z);
    vertex(inside[0].x, inside[0].y, inside[0].z);
    endShape();
    int radi = rad;
    if (radi >= radian) radi = radian-1;
    //蓋動くほう
    beginShape();
    vertex(outside[radi].x, outside[radi].y, outside[radi].z);
    vertex(outside[radi].x, outside[radi].y, -outside[radi].z);
    vertex(inside[radi].x, inside[radi].y, -inside[radi].z);
    vertex(inside[radi].x, inside[radi].y, inside[radi].z);
    endShape();


    if (Drawing())rad += up;
  }

  public boolean Drawing() {
    return rad < radian;
  }
}

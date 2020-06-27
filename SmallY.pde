class Y extends Font {
  float z;
  Y(float s, PVector p,color c) {
    super(s, p,c);
    z = leng/2;

    partsPos = new PVector[8];
    //partsPos[0] = new PVector(0, 0, z);
    partsPos[1] = new PVector(size*0.15f, -size*0.3f, z);
    partsPos[2] = new PVector(size*0.35f, -size*0.3f, z);
    //partsPos[3] = new PVector(-size/4f, size*0.9f, z);
    //partsPos[4] = new PVector(-size/4f - leng, size*0.9f, z);
    //partsPos[5] = new PVector(-size/10f, size/5f, z);
    partsPos[6] = new PVector(-size*0.35f, -size*0.3f, z);
    partsPos[7] = new PVector(-size*0.15f, -size*0.3f, z);
    partsPos[0] = new PVector(partsPos[1].x, partsPos[1].y, partsPos[1].z);
    partsPos[3] = new PVector(partsPos[2].x, partsPos[2].y, partsPos[2].z);
    partsPos[4] = new PVector(partsPos[1].x, partsPos[1].y, partsPos[1].z);
    partsPos[5] = new PVector(partsPos[6].x, partsPos[6].y, partsPos[6].z);
  }
  public Y(float s,PVector p){this(s,p,color(1,1,1,1));}

  protected void Draw() {
    translate(0, size/4*3);//自動調整を修正
    /*
    for (int i=-1; i<1; i+=2) {
     beginShape();
     vertex(0, 0, z * i);//真ん中
     vertex(15, -30, z * i);//右上
     vertex(35, -30, z * i);//右上
     //vertex(-25, 90, z * i);  //下ver1
     //vertex(-45, 90, z * i);  //下ver1
     vertex(-15, 70, z * i);//下ver2
     vertex(-35, 70, z * i);//下ver2
     vertex(-10, 20, z * i);//真ん中左下
     vertex(-35, -30, z * i);//左上
     vertex(-15, -30, z * i);//左上
     endShape(CLOSE);
     }
     */

    //奥と手前
    for (int i=-1; i<=1; i+=2) {
      beginShape();
      for (int j=0; j<partsPos.length; j++) {
        vertex(partsPos[j].x, partsPos[j].y, partsPos[j].z * i);
      }
      endShape(CLOSE);
    }

    beginShape(QUAD_STRIP);
    for (int j=0; j<partsPos.length; j++) {
      for (int i=-1; i<=1; i+=2) {
        vertex(partsPos[j].x, partsPos[j].y, partsPos[j].z * i);
      }
    }
    vertex(partsPos[0].x, partsPos[0].y, partsPos[0].z * -1);
    vertex(partsPos[0].x, partsPos[0].y, partsPos[0].z);
    endShape(CLOSE);


    //左上から真ん中に向かって移動
    if (partsPos[0].y < 0) {
      partsPos[0].add(new PVector(-0.5f, 1));
    }
    //左上から真ん中に向かって移動
    if (partsPos[5].x <-size/10f) {
      partsPos[5].add(new PVector(0.5f, 1));
    }
    //右上から左下に向かって移動
    if (Drawing()) {
      partsPos[3].add(new PVector(-0.5f, 1));
      partsPos[4].add(new PVector(-0.5f, 1));
    }
  }

  public boolean Drawing() {
    return partsPos[3].y < size*0.7f;
  }
}

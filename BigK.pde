class K extends Font {
  float z;
  K(float s, PVector p,color c) {
    super(s, p,c);
    z = leng/2;

    partsPos = new PVector[11];
    //partsPos[0] = new PVector(0, 0, z);
    //partsPos[1] = new PVector(size/2, size/2, z);
    //partsPos[2] = new PVector(size/2-leng, size/2, z);
    //partsPos[3] = new PVector(-size/10, size/10, z);
    //partsPos[4] = new PVector(-size/10, size/2, z);
    //partsPos[5] = new PVector(-size/2 + leng, size/2, z);
    partsPos[6] = new PVector(-size/2 + leng, -size/2, z);
    partsPos[7] = new PVector(-size/10, -size/2, z);
    //partsPos[8] = new PVector(-size/10, -size/10, z);
    partsPos[9] = new PVector(size/2 - leng, -size/2, z);
    partsPos[10] = new PVector(size/2, -size/2, z);

    partsPos[0] = new PVector(size/2, -size/2, z);
    partsPos[1] = new PVector(size/2, -size/2, z);
    partsPos[2] = new PVector(size/2 - leng, -size/2, z);
    partsPos[3] = new PVector(-size/10, -size/2, z);
    partsPos[4] = new PVector(-size/10, -size/2, z);
    partsPos[5] = new PVector(-size/2 + leng, -size/2, z);
    partsPos[8] = new PVector(-size/10, -size/2, z);
  }
  public K(float s,PVector p){this(s,p,color(1,1,1,1));}

  protected void Draw() {
    translate(-size/2, size/2);//位置調整
    /*
    for (int i=-1; i<=1; i+=2) {
     beginShape();
     vertex(0, 0, z * i);
     vertex(50, 50, z * i);
     vertex(30, 50, z * i);
     vertex(-10, 10, z * i);
     vertex(-10, 50, z * i);
     vertex(-30, 50, z * i);
     vertex(-30, -50, z * i);
     vertex(-10, -50, z * i);//
     vertex(-10, -10, z * i);
     vertex(30, -50, z * i);
     vertex(50, -50, z * i);
     endShape(CLOSE);
     }
     */
    //表裏
    for (int i=-1; i<=1; i+=2) {
      beginShape();
      for (int j=0; j<partsPos.length; j++) {
        vertex(partsPos[j].x, partsPos[j].y, partsPos[j].z * i);
      }
      endShape(CLOSE);
    }

    //側面
    beginShape(QUAD_STRIP);
    for (int j=0; j<partsPos.length; j++) {
      for (int i=-1; i<=1; i+=2) {
        vertex(partsPos[j].x, partsPos[j].y, partsPos[j].z * i);
      }
    }
    vertex(partsPos[0].x, partsPos[0].y, partsPos[0].z * -1);
    vertex(partsPos[0].x, partsPos[0].y, partsPos[0].z);
    endShape(CLOSE);

    if (partsPos[0].x > 0)partsPos[0].add(new PVector(-1, 1));
    PVector down = new PVector(0, 1);
    if (Drawing()) {
      partsPos[1].add(down);
      partsPos[2].add(down);
      partsPos[4].add(down);
      partsPos[5].add(down);
    }
    if (partsPos[3].y < size/10)partsPos[3].add(down);
    if(partsPos[8].y < -size/10)partsPos[8].add(down);
  }
  
  public boolean Drawing(){
    return partsPos[1].y < size/2;
  }
}

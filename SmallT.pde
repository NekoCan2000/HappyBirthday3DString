class T extends Font {
  T(float s, PVector p, color c) {
    super(s, p, c);
    hei = new float[2];
    wid = new float[2];
    heiNow = new float[2];
    partsPos = new PVector[2];

    hei[0] = leng;
    hei[1] = size/2;
    wid[0] = size/5 * 2;
    wid[1] = leng;
    partsPos[0] = new PVector(0, size/4 * 3 - size/4);
    partsPos[1] = new PVector(0, size/4 * 3 - size/10 - leng);
    partsPos[0] = new PVector(0, size/2 + leng/2);
    partsPos[1] = new PVector(0, size/2);
  }
  public T(float s,PVector p){this(s,p,color(1,1,1,1));}
}

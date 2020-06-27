class I extends Font {
  I(float s, PVector p,color c) {
    super(s, p,c);

    hei = new float[2];
    heiNow = new float[2];
    wid = new float[2];
    partsPos = new PVector[2];
    hei[0] = leng;
    hei[1] = size/2;
    wid[0] = wid[1] = leng;
    partsPos[0] = new PVector(0, size/2 - size/4);
    partsPos[1] = new PVector(0, size/2);
  }
  public I(float s,PVector p){this(s,p,color(1,1,1,1));}
}

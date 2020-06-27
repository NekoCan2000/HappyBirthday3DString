class H extends Font {

  H(float s, PVector p,color c) {
    super(s, p,c);
    heiNow = new float[3];
    hei = new float[3];
    wid = new float[3];

    wid[0] = wid[2] = leng;
    wid[1] = size - (leng * 3);

    hei[0] = hei[2] = size;
    hei[1] = leng;

    partsPos = new PVector[3];
    partsPos[0] = new PVector(-size/4, 0);
    partsPos[1] = new PVector(0, size/2 - leng/2);
    partsPos[2] = new PVector(size/4, 0);
  }
  public H(float s,PVector p){this(s,p,color(1,1,1,1));}
}

class N extends Font {
  Donut donut;
  N(float s, PVector p,color c) {
    super(s, p,c);
    donut = new Donut(s/4f, new PVector(size/20, size - size/5), s/5f, 180, -90, (int)2);
    donut.setColor(c);


    hei = new float[2];
    wid = new float[2];
    heiNow = new float[2];
    partsPos = new PVector[2];
    hei[0] = size/2+leng/2;
    wid[0] = wid[1] = leng;
    hei[1] = size*0.35f;
    partsPos[0] = new PVector(-leng/2, size - hei[0]);
    partsPos[1] = new PVector(leng, size-hei[1]);
  }
  public N(float s,PVector p){this(s,p,color(1,1,1,1));}

  protected void Draw() {
    donut.update();
    for (int i=0; i<hei.length; i++) {
      pushMatrix();
      translate(partsPos[i].x, partsPos[i].y + heiNow[i]/2);
      box(wid[i], heiNow[i], leng);
      popMatrix();
    }
    for (int i=0; i<hei.length; i++)if (heiNow[i]<hei[i])heiNow[i]++;
  }
  public boolean Drawing() {
    return donut.Drawing();
  }
}

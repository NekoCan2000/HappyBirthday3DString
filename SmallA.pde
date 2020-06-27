class A extends Font {
  Donut donut;
  A(float s, PVector p,color c) {
    super(s, p,c);
    
    donut = new Donut(s/4f, new PVector(-size/25, size - size/7.5f), s/6f, 270, -125, (int)2);
    donut.setColor(c);

    wid = new float[1];
    wid[0] = leng;

    hei = new float[1];
    hei[0] = size/2f;
    heiNow = new float[1];
    partsPos = new PVector[1];
    partsPos[0] = new PVector(hei[0]/4, hei[0]);
  }

  public A(float s,PVector p){this(s,p,color(1,1,1,1));}
  
  protected void Draw() {
    donut.update();
    if (heiNow[0] < hei[0]) heiNow[0]++;
    translate(partsPos[0].x, partsPos[0].y + heiNow[0]/2, partsPos[0].z);
    box(wid[0], heiNow[0], leng);
  }

  public boolean Drawing() {
    return donut.Drawing();
  }
}

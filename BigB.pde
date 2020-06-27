public class B extends Font {
  Donut[] donuts; 
  public B(float s, PVector p,color c) {
    super(s, p,c);
    donuts = new Donut[2];
    float y = size/4f +size/7.5f;
    donuts[0] = new Donut(s/4f, new PVector(size/25, y), s/6f, 180, (int)2);
    donuts[1] = new Donut(s/3f, new PVector(size/25, y * 2 + s/12), s/6f, 180, (int)2);
    donuts[0].setColor(c);
    donuts[1].setColor(c);

    hei = new float[1];
    heiNow = new float[1];
    wid = new float[1];
    hei[0] = size;
    wid[0] = leng;
  }
  
  public B(float s,PVector p){this(s,p,color(1,1,1,1));}
  
  protected void Draw() {
    for (int i=0; i<donuts.length; i++) {
      donuts[i].update();
    }
    if (Drawing())heiNow[0]++;
    translate(-wid[0]/2, heiNow[0]/2);
    box(wid[0], heiNow[0], leng);
  }

  public boolean Drawing() {
    return heiNow[0] < hei[0];
  }
}

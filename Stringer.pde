class Font {
  public float size;//サイズ比率
  public float leng;//奥行サイズ（length）
  public float[] heiNow, hei, wid;//現在の高さ,理想高さ,横幅
  public PVector pos;//全体位置
  public PVector[] partsPos;//各パーツの位置
  public color c;//色
  
  public Font(float s,PVector p,color c){
    size = s;
    pos = p;
    leng = size/5f;
    this.c = c;
  }
  
  public Font(float s, PVector p) {
    this(s,p,color(1,1,1,1));
  }
  
  public void setColor(color c){
    this.c = c;
  }
  
  //メインからこのメソッドを呼ぶ
  public void update() {
    pushMatrix();
    translate(pos.x, pos.y-size/2f, pos.z);
    this.Draw();
    popMatrix();
  }
  
  //このメソッドをオーバーライドして文字を描く
  protected void Draw() {
    for (int i=0; i<hei.length; i++) {
      if (heiNow[i] < hei[i]) heiNow[i]++;
      pushMatrix();
      translate(partsPos[i].x, partsPos[i].y + heiNow[i]/2, 0);
      box(wid[i], heiNow[i], leng);
      popMatrix();
    }
  }

  //文字を描いている真偽
  public boolean Drawing() {
    return heiNow[heiNow.length-1] < hei[hei.length-1];
  }
}

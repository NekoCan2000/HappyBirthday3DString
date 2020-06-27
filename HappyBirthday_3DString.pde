//class別にファイルを分ける 
//https://www.d-improvement.jp/learning/processing/2011-b/10.html

int month = 1, day = 1;//祝う誕生日

TList<Star> stars = new TList<Star>();//表示する☆彡
TList<Star> starPool = new TList<Star>();//プールする☆彡
TList<Font> str = new TList<Font>();//立体文字リスト
float[] r = new float[360];//回転角度をキャッシュ
int rotateNum = 0;//回転角度
boolean enable = false;//立体文字の表示非表示

void setup() {
  size(1000, 800, P3D);
  //fullScreen(P3D);
  frameRate(30);
  textSize(30);
  colorMode(HSB, 1);//HSBモードに変更して徐々に色が変わるようにしたい
  textAlign(CENTER);//時刻を中央揃え
  background(0, 0, 0, 1);
  randomSeed(millis());

  //各文字を生成
  float y = -200;
  str.add( new H(100, new PVector(-400, y)));
  str.add( new A(100, new PVector(-325, y)));
  str.add( new P(100, new PVector(-275, y)));
  str.add( new P(100, new PVector(-220, y)));
  str.add( new Y(100, new PVector(-150, y)));
  str.add( new B(100, new PVector(-50, y)));
  str.add( new I(100, new PVector(10, y)));
  str.add( new R(100, new PVector(30, y)));
  str.add( new T(100, new PVector(120, y)));
  str.add( new Hs(100, new PVector(180, y)));
  str.add( new D(100, new PVector(250, y)));
  str.add( new A(100, new PVector(310, y)));
  str.add( new Y(100, new PVector(380, y)));

  float colorNum = 1;
  colorNum = 0;
  float up = 1f/(float)str.size();//文字数で虹色感
  for (Font f = str.head2Now(); f != null; f = str.getNext(), colorNum+=up) {
    f.setColor(color(colorNum, 1, 1, 1));
    println("color"+colorNum);
  }

  //回転角度のキャッシュ
  for (int i=0; i<360; i++)r[i] = radians(i);
}

void draw() {
  //中央に移動
  translate(width/2, height/2);
  //ウィンドウのタイトルにフレームレートと☆彡の合計サイズを表示
  surface.setTitle("fps : " + (int)frameRate+" stars : "+(stars.size()+starPool.size()));
  lights();//影ほしい

  //黒で残像のこりの塗りつぶし
  fill(0, 0, 0, 0.1f);
  noStroke();
  pushMatrix();
  translate(0, 0, -500);
  rect(-width, -height, width * 2, height * 2);
  popMatrix();

  stroke(0.16f, 0.9f, 1, 1);
  fill(0, 0, 0, 0);
  if (mousePressed) {
    //プールにあればプールから、なければ☆彡生成
    Star s = starPool.size() > 0 ? starPool.head2Now() : new Star(random(5, 25));
    s.position = new PVector(mouseX-width/2, mouseY-height/2);
    s.velocity = new PVector(random(-10, 10), random(-30, -10));
    stars.add(s);
    starPool.remove();
  }
  
  //リスト内の星を動かす
  for (Star s = stars.head2Now(); s!=null; s = stars.getNext()) {//こういうfor文が書ける連結リストが欲しかったから作った
    s.update();
    if (s.position.x > width/2 + s.size || s.position.x < -s.size - width/2 || s.position.y > height/2 + s.size) {
      s.reset();//星の数値をリセット
      stars.removeNow();//従来ならエラーするfor文内での削除も行える
      starPool.add(s);
    }
  }

  //立体文字と時刻の回転
  rotateY(r[rotateNum]);

  //立体文字表示
  noStroke();
  if (enable || (month()==month && day() == day)) {//日付になったら絶対表示
    Font f = str.head2Now(); //先頭文字の取得
    Font prev = f; //前文字を用意
    fill(f.c);
    f.update();//先頭文字を描く
    //前の文字が書き終えるまで次の文字は表示しない
    for (f = str.getNext(); f != null && !prev.Drawing(); prev = f, f = str.getNext()) {
      fill(f.c);
      f.update();
    }

    //全部の文字を表示したら回転しない（中途半端な角度なら回転し続ける）
    if (prev.Drawing() || rotateNum > 0)rotateNum = (rotateNum+1)%360;
  }

  //現在時刻
  fill(1, 0, 1, 1);
  text(String.format("%d/%02d/%02d\n%02d:%02d:%02d\n", year(), month(), day(), hour(), minute(), second()), 0, 0);
}

void keyPressed() {

  if (key == 'a')rotateNum = (rotateNum+1)%360;//手動回転
  else if (key == 'z')rotateNum = (rotateNum-1) < 0 ? 359 : rotateNum-1; //手動回転
  else if (key == 's') enable = !enable;//表示非表示切り替え
}

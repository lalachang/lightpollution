
float x = 100;
float y = 7;
int z = 5;

int o = 2;


void setup() {
  size (600, 600);
  colorMode(HSB, 360, 100, 100);
  background(1, 100, 0);
  noStroke();
  smooth();
  fill(random(0, 360), 0, 100);
  glyph(width/2, height/2, x, y, o, z);
  beginRecord(PDF, "everything.pdf");
}

void draw() {
}

void keyReleased() {
  if (keyCode == TAB) {
    background(0);
    fill(random(0, 360), 0, 100);
    o= int(random(5, 6));  // how many legs
    glyph(width/2, height/2, x, y, o, z);
  }
   if (key == 'q') {
    endRecord();
    exit();
  }
}

void glyph(float X1, float Y1, float H, float B, int o, int p) {
  int[] tabo = new int[p];
  float[] tabH = new float[p];
  float[] tabB = new float[p];
  float[] tabzzR = new float[p];

  tabo[p-1] = o;
  tabH[p-1] = H;
  tabB[p-1] = B;
  tabzzR[p-1] = 0;

  for (int i = p-2; i >= 0; i--) {
    tabo[i] = int(random(2, 5)); // 5k6ru32j04 the folds
    tabH[i] = tabH[i+1]*random(0.1, 1);
    tabB[i] = tabB[i+1]*random(0.8, 1);
    tabzzR[i] = random(300); 
  }
  glyphx(X1, Y1, tabH, tabB, tabzzR, tabo, p);
}

void glyphx(float X1, float Y1, float H[], float B[], float zzR[], int o[], int p) {
  p--;
  if (p+1 > 0 && o[p] != 0)
  {
    float zz;
    if (zzR[p] == 0)
      zz = (TWO_PI-zzR[p])/(o[p]);
    else
      zz = (TWO_PI-zzR[p])/(o[p]-1);

    pushMatrix();
    translate(X1, Y1);
    rotate(-(TWO_PI-zzR[p])/2);
    for (int i =0; i < o[p]; i++) {
      rect(0, -B[p]/2, H[p], B[p]);
      glyphx(H[p], 0, H, B, zzR, o, p);
      rotate(zz);
    }
    popMatrix();
  }
}

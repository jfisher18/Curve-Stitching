class CurveStitch {
  float xa, ya, xb, yb, xc, yc;
  CurveStitch (float xaIn, float yaIn, float xbIn, float ybIn, float xcIn, float ycIn) {
    xa=xaIn;
    ya=yaIn;
    xb=xbIn;
    yb=ybIn;
    xc=xcIn;
    yc=ycIn;
  }
  void drawCurve() {
    line(xa, ya, xb, yb);
    line(xb, yb, xc, yc);
    for (int i = 0; i < lines-1; i++) {
      line(xa+(i+1)*(xb-xa)/lines, ya+(i+1)*(yb-ya)/lines, xb+(i+1)*(xc-xb)/lines, yb+(i+1)*(yc-yb)/lines);
    }
    ellipseMode(RADIUS);
    ellipse(xa, ya, radius, radius);
    ellipse(xb, yb, radius, radius);
    ellipse(xc, yc, radius, radius);
  }
  void dragPoint(int point) {
    if (point == 1) {
      xa = mouseX;
      if (mouseX > width) {
        xa = width;
      }
      if (mouseX < 0) {
        xa = 0;
      }
      ya = mouseY;
      if (mouseY > height) {
        ya = height;
      }
      if (mouseY < 0) {
        ya = 0;
      }
    } else if (point == 2) {
      xb = mouseX;
      if (mouseX > width) {
        xb = width;
      }
      if (mouseX < 0) {
        xb = 0;
      }
      yb = mouseY;
      if (mouseY > height) {
        yb = height;
      }
      if (mouseY < 0) {
        yb = 0;
      }
    } else if (point == 3) {
      xc = mouseX;
      if (mouseX > width) {
        xc = width;
      }
      if (mouseX < 0) {
        xc = 0;
      }
      yc = mouseY;
      if (mouseY > height) {
        yc = height;
      }
      if (mouseY < 0) {
        yc   = 0;
      }
    }
  }
}
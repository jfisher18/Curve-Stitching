int lines;
int point;
int index=-1;
int radius = 6;
int maxLines = 70;
ArrayList<CurveStitch> curveArray;
void setup() {
  size(960, 540);
  curveArray = new ArrayList<CurveStitch>();
}

void draw() {
  lines = int(mouseX/960.0*maxLines);
  background(255);
  fill(255, 0, 0);
  stroke(0);
  if (curveArray.size() > 0) {
    for (CurveStitch curve : curveArray) {
      curve.drawCurve();
    }
  }
}
void mousePressed() {
  if (mouseButton == LEFT || curveArray.size() > 0) {
    point = 0;
    for (int i = 0; i < curveArray.size (); i++) {
      if (int(sqrt(pow(mouseX-curveArray.get(i).xa, 2)+pow(mouseY-curveArray.get(i).ya, 2)))<=radius) {
        point = 1;
        index = i;
      } else if (int(sqrt(pow(mouseX-curveArray.get(i).xb, 2)+pow(mouseY-curveArray.get(i).yb, 2)))<=radius) {
        point = 2;
        index = i;
      } else if (int(sqrt(pow(mouseX-curveArray.get(i).xc, 2)+pow(mouseY-curveArray.get(i).yc, 2)))<=radius) {
        point = 3;
        index = i;
      }
    }
  }
  if (mouseButton == RIGHT) {
    curveArray.add(new CurveStitch(int(random(0,960)), int(random(0,540)), int(random(0,960)), int(random(0,540)), int(random(0,960)), int(random(0,540))));
    //curveArray.add(new CurveStitch(40, 40, 480, 500, 920, 40));
  }
}
void mouseDragged() {
  if (point > 0 || index != -1) {
    curveArray.get(index).dragPoint(point);
  }
}

// GDV_reus_de_bas_les3hoorcollege

void setup(){
  //size(700, 500);
  size(1920, 1080);
  
  for (int i = 0; i < 11; i = i+1) {
    dubble((int) random(0, 100));
  }
}

void draw(){
  drawRegtancle(randomValue(width), randomValue(height), randomValue(width), randomValue(height));
}

void dubble(int a){
  a *= 2;
  println(a);
}

void drawRegtancle(float x, float y, float targetWidth, float targetHeight){
  fill(randomColorValue(), randomColorValue(), randomColorValue());
  rect(x, y, targetWidth, targetHeight);
}

int randomValue(int max){
  return (int) random(0, max);
}

int randomColorValue(){
  return (int) random(0, 255);
}

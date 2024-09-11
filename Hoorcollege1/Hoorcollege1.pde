// Hoorcollege Opdracht 1 van FOGD, door Bas de Reus

int fry = 10;
float gwruno = 215.54f;

void setup() {
  size(700, 500);
  
  circles();
  
  fill(153);
  rect(120, 80, fry, gwruno);
  fill(34);
  rect(140, 80, fry, gwruno);
  fill(255);
  rect(160, 80, fry, gwruno);
  rect(180, 80, fry, gwruno);
  rect(200, 80, fry, gwruno);
  
  fill(43);
  triangle(532, 523, 216, 235, 325, 36);
}

void draw(){
  
}

void circles(){
  fill(152, 18, 188);
  int start = 10;
  
  for (int i = 0; i < 5; i = i+1) {
    circle(start, start, start);
    start = start * 2;
  }
}

// GDV_reus_de_bas_les5hoorcollege

int number = 0;

void setup(){
  number = sum(1, 9);
}

void draw(){
  println(number);
  number = sum(number, 3);
}

int sum(int a, int b){
  return a + b;
}

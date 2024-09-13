int theNumber = 0;
int randomNumber;

int numerator;
int divisor;

void setup(){
  size(420, 69);
}

void draw(){
  //NumberOne();
  //NumberTwo();
  //NumberThree();
  //NumberFour();
  NumberFive();
}

void NumberOne(){
  theNumber += 1;
  println("Number 1 \n" + theNumber);
}

void NumberTwo(){
  randomNumber = (int) random(10, 20);
  println("Number 2 \n" + randomNumber);
}

void NumberThree(){
  numerator = (int) random(20, 50);
  divisor = (int) random(1, 10);
  println("Number 3 \n" + numerator + " / " + divisor + " = " + numerator / divisor);
}

void NumberFour(){
  numerator = (int) random(20, 50);
  divisor = (int) random(1, 10);
  println("Number 4 \n" + numerator + " / " + divisor + " = " + (float) numerator / divisor);
}

void NumberFive(){
  numerator = (int) random(20, 50);
  divisor = (int) random(1, 10);
  
  int result = numerator / divisor;
  float rest = numerator % divisor;
  
  println("Number 5 \n" + numerator + " / " + divisor + " = " + result + "\n" + rest);
}

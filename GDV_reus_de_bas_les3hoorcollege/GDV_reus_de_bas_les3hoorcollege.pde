// GDV_reus_de_bas_les3hoorcollege

int firstNumber;
int secondeNumber;

boolean canCountBack;

void setup(){
  size(600, 600);
  background(#1e1e2e);
}

void draw(){
  count();
  countByThree();
}

void count(){
  if(firstNumber > 10)
    return;
  
  println("Number 1: " + firstNumber);
  firstNumber++;
}

void countByThree(){
  println("Number 2: " + secondeNumber);
  
  if (secondeNumber >= width)
    canCountBack = true;
  else if (secondeNumber <= 0)
    canCountBack = false;

  secondeNumber = canCountBack ? secondeNumber - 2 : secondeNumber + 3 ;
}

// GDV_reus_de_bas_les2practicum
// Basic = true
// Advanced = true
// Expert = false

// A global time value
float timer;
final float timerAddAmount = 0.02f;
final float resetMargin = 1.5;

int startPosX;
int startPosY;
int startPosYAmount = -10;
int speedX;
int speedY;
final int two = 2;

boolean isGoingRight = true;

void setup(){
  size(700, 1000);
  setRandomValues();
}

void draw(){
  timer += timerAddAmount;
  //println(timer); // 0.099999994
  
  background(#1e1e2e);
  
  cricleSquareCricle();
  
  if (startPosY > height)
    println("Benden " + startPosY);
  
  // automatic restart
  if (startPosY > height * resetMargin)
    BigReset();
}

// Reset very value that should be reset
void BigReset(){
  timer = 0;
  setRandomValues();
  startPosY = startPosYAmount;
}

// random values for start position and speed
void setRandomValues(){
  //startPosX = (int) random(width * 0.25, width * 0.75); // I like this more
  startPosX = (int) random(0, width);
  speedX = (int) random(1, 10);
  speedY = (int) random(1, 5);
}

void cricleSquareCricle(){
  // initialize the varibles
  int size = 50;
  int radius = 25;
  
  startPosY += timer * speedY;
  
  // set is going right
  if (startPosX >= width)
    isGoingRight = false;
  else if (startPosX < 0)
    isGoingRight = true;
  
  // change position by the bool
  if (isGoingRight)
    startPosX += timer * speedX;
  else
    startPosX -= timer * speedX;
  
  // math for square
  float squareSize = size;
  float halfSquareSize = squareSize / two;
  
  // math for circle
  float circleDiameter = radius * two;
  float yes = 1;
  yes = isGoingRight ? yes + circleDiameter : yes - circleDiameter;
  
  // shrinking and growing for the circle
  float circleSize = circleDiameter;
  if (isGoingRight)
    circleSize *= timer;
  else
    circleSize /= timer;
  
  float leftCirclePositionX = startPosX - halfSquareSize - circleSize / two;
  
  // color and centering
  fill(#a68ab7);
  rectMode(CENTER);

  // creating shapes
  square(startPosX, startPosY, squareSize);
  circle(leftCirclePositionX, startPosY, circleDiameter + circleSize);
}

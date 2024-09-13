// Practicum Opdracht 2, door Bas de Reus
// basic true
// advanced true
// expert true

// A global time value
float timer;

int windowSizeX = 1920;
int windowSizeY = 1080;

int positionX;
int positionY;
int speedX;
int speedY;

void setup(){
  size(1920, 1080);
  setRandomValues();
}

void draw(){
  // making time
  timer += 0.02;
  
  // reset everything for Ton
  if (timer > 3)
  {
    timer = 0;
    setRandomValues();
  }
  
  background(#1e1e2e);

  cricleSquareCricle();
}

// random values for start position and speed
void setRandomValues(){
  positionX = (int) random(100, windowSizeX - 100);
  positionY = (int) random(100, windowSizeY - 100);
  speedX = (int) random(-5, 5);
  speedY = (int) random(-5, 5);
}

// The square is the parent object for the circles
// They will move via the timer float
void cricleSquareCricle(){
  
  // initialize the varibles
  int size = 50;
  int radius = 25;
  
  positionX += timer * speedX;
  positionY += timer * speedY;
  
  // math for square
  float squareSize = size * timer;
  float halfSquareSize = squareSize / 2;
  
  // math for circles
  float circleDiameter = (radius * 2) * timer;
  float leftCirclePositionX = positionX - halfSquareSize - circleDiameter / 2;
  float rightCirclePositionX = positionX + halfSquareSize + circleDiameter / 2;
  
  // color and centering
  fill(#a68ab7);
  rectMode(CENTER);

  // creating shapes
  square(positionX, positionY, squareSize);
  circle(leftCirclePositionX, positionY, circleDiameter);
  circle(rightCirclePositionX, positionY, circleDiameter);
}

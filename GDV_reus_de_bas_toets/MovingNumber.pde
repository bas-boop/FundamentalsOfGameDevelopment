class MovingNumber
{
  // the number that this moving number is repestanting
  int number;
  
  // current value of the moving number
  float posX;
  float posY;
  float currentSpeedX;
  
  // consturctor for the moving number
  MovingNumber(int numberToBe, int x, float randomMinSpeed, float randomMaxSpeed){
    number = numberToBe;
    posX = x;
    posY = randomYPosition();    
    currentSpeedX = random(randomMinSpeed, randomMaxSpeed);
  }
  
  void drawMovingNumber(){
    updateXPosition();
    
    fill(255, 255, 0);
    text(number, posX, posY);
  }
  
  // gives at random the bottum position or the top position
  float randomYPosition(){
    int r = (int) random(0, 2);
    
    if (r == 0)
      return textSize;
    else if (r == 1)
      return height - textSize;
    else    
      return 0;
  }
  
  // Make moving number zigzag
  void updateXPosition() {
    currentSpeedX = calculateNewSpeed(posX, currentSpeedX, width);
    posX = calculateNewPosition(posX, currentSpeedX);
  }
  
  // When bounces, invert speed
  float calculateNewSpeed(float currentPosition, float speed, int boundary)
  {
    if (currentPosition <= 0 
        || currentPosition >= boundary) 
      return -speed;
    
    return speed;
  }
  
  float calculateNewPosition(float currentPosition, float speed) {
    return currentPosition + speed;
  }
}

class Cluster {
  // start values set at contructor
  int startPosYAmountMin = -10;
  int startPosYAmountMax = -10;
  float speedXMin;
  float speedXMax;
  float speedYMin;
  float speedYMax;
  
  // current value of the cluster
  float posX;
  float posY;
  float currentSpeedX;
  float currentSpeedY;
  
  boolean isGoingRight;
  boolean hasHitTheButtom;

  float spawnOffset = 5;

  // Add size constraints
  float minSize = 30;
  float maxSize = 60;

  Cluster(float targetSpeedXMin, float targetSpeedXMax, float targetSpeedYMin, float targetSpeedYMax, 
          int targetStartPosYMin, int targetStartPosYMax) {
    speedXMin = targetSpeedXMin;
    speedXMax = targetSpeedXMax;
    speedYMin = targetSpeedYMin;
    speedYMax = targetSpeedYMax;
    startPosYAmountMin = targetStartPosYMin;
    startPosYAmountMax = targetStartPosYMax;
    
    reset();
  }

  void reset() {
    posY = random(startPosYAmountMin, startPosYAmountMax);
    posX = (int) random(0 + spawnOffset, width - spawnOffset);
    currentSpeedX = random(speedXMin, speedXMax);
    currentSpeedY = random(speedYMin, speedYMax);
    isGoingRight = true;
    hasHitTheButtom = false;
    
    println(currentSpeedX + " " +
    currentSpeedY + " " +
    posY + "\n");
  }

  // Make cluster zigzag
  void updateXPosition() {
    currentSpeedX = calculateNewSpeed(posX, currentSpeedX, width);
    posX = calculateNewPosition(posX, currentSpeedX);
  }

  // Make cluster fall
  void updateYPosition() {
    posY = calculateNewPosition(posY, currentSpeedY);
  }
  
  float calculateNewPosition(float currentPosition, float speed) {
    return currentPosition + speed;
  }

  // When bounces, invert speed
  float calculateNewSpeed(float currentPosition, float speed, int boundary) {
    if (currentPosition <= 0 || currentPosition >= boundary) {
      return -speed;
    }
    return speed;
  }

  // Updated size calculation
  float calculateSize(float speedY) {
    // Use sine wave to oscillate between minSize and maxSize
    float sizeRange = maxSize - minSize;
    float sizeVariation = (sizeRange / 2) * sin(timer * speedY) + (sizeRange / 2);

    return minSize + sizeVariation;
  }

  // Draw the cluster
  void drawCluster(float posX, float posY, int size) {
    int radius = size / two;
    float squareSize = size * 0.5;
    float halfSquareSize = squareSize / two;

    float circleDiameter = radius * 4;

    float leftCirclePositionX = posX - halfSquareSize - circleDiameter / two;
    float rightCirclePositionX = posX + halfSquareSize + circleDiameter / two;

    fill(#a68ab7);
    square(posX, posY, squareSize);
    circle(leftCirclePositionX, posY, circleDiameter);
    circle(rightCirclePositionX, posY, circleDiameter);
  }
}

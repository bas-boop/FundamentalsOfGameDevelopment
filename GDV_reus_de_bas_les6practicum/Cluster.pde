class Cluster {
  final int startPosYAmount = -10;
  float posX;
  float posY;
  float speedMin;
  float speedMax;
  float currentSpeedX;
  float currentSpeedY;
  boolean isGoingRight;
  boolean hasHitTheButtom;

  Cluster(float targetSpeedMin, float targetSpeedMax) {
    speedMin = targetSpeedMin;
    speedMax = targetSpeedMax;
    posY = startPosYAmount;
    
    reset();
  }

  void reset() {
    posY = startPosYAmount;
    posX = (int) random(0, width);
    currentSpeedX = random(speedMin, speedMax);
    currentSpeedY = random(speedMin, speedMax);
    isGoingRight = true;
    hasHitTheButtom = false;
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

  // When bouncen, invert speed
  float calculateNewSpeed(float currentPosition, float speed, int boundary) {
    if (currentPosition <= 0
      || currentPosition >= boundary) {
      return -speed;
    }
  
    return speed;
  }

  // Same cluster size math as before
  float calculateSize(float speedY) {
    int baseSize = 30;
    int angle = 20;

    float sizeVariation = angle * sin(timer * speedY);
    float dynamicSize = baseSize + sizeVariation;

    return dynamicSize;
  }

  // Same draw cluster function as before
  void drawCluster(float posX, float posY, int size) {
    int radius = size / two;
    float squareSize = size;
    float halfSquareSize = squareSize / two;

    float circleDiameter = radius * two;
    float circleSize = circleDiameter * timer;

    float leftCirclePositionX = posX - halfSquareSize - circleSize / two;

    fill(#a68ab7);
    square(posX, posY, squareSize);
    circle(leftCirclePositionX, posY, circleDiameter + circleSize);
  }
}

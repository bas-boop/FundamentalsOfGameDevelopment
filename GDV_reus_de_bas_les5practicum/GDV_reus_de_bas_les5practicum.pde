// GDV_reus_de_bas_les5Practicum
// Basic = true
// Advanced = true
// Expert = true

// gobal vars, some can't be changed
float timer;
final float timerAddAmount = 0.02f;
final float resetMargin = 3;
int startPosYAmount = -10;
final int two = 2;
PVector pos;

class Cluster {
  int posX;
  int posY;
  int speedX;
  int speedY;
  boolean isGoingRight;
  boolean hasHitTheButtom;

  Cluster() {
    reset();
    posY = startPosYAmount;
  }

  void reset() {
    posX = (int) random(0, width);
    speedX = (int) random(1, 10);
    speedY = (int) random(1, 5);
    isGoingRight = true;
    hasHitTheButtom = false;
  }
}

class Player {
  PVector position;

  Player() {
    position = new PVector(width / 2, height - 50);
  }
}

Cluster cluster1 = new Cluster();
Cluster cluster2 = new Cluster();
Player player = new Player();

void setup() {
  size(700, 1000);
  rectMode(CENTER);
}

void draw() {
  timer += timerAddAmount;
  background(#1e1e2e);

  updateAndDrawCluster(cluster1);
  updateAndDrawCluster(cluster2);
  moveSquareToMouse(false);

  if (cluster1.posY > height * resetMargin 
      && cluster2.posY > height * resetMargin) {
    BigReset();
  }
}

// Move square to the mouse, option to only follow mouse horizantaly
void moveSquareToMouse(boolean followMouseY) {
  player.position.x = mouseX;
  player.position.y = followMouseY 
              ? mouseY 
              : height - 50 ;
  
  square(player.position.x, player.position.y, 100);
}

int calculateNewPosition(int currentPosition, int speed) {
  return currentPosition + speed;
}

// When bouncem, invert speed
int calculateNewSpeed(int currentPosition, int speed, int boundary) {
  if (currentPosition <= 0
      || currentPosition >= boundary) {
    return -speed;
  }
  
  return speed;
}

// Update position and draw cluster
void updateAndDrawCluster(Cluster cluster) {
  updateXPosition(cluster);
  updateYPosition(cluster);
  
  int clusterSize = calculateClusterSize(cluster.speedY);
  if (!cluster.hasHitTheButtom)
    displayMessageIfDown(cluster.posY, clusterSize, cluster);
  
  drawCluster(cluster.posX, cluster.posY, clusterSize);
}

// Make cluster zigzag
void updateXPosition(Cluster cluster) {
  cluster.speedX = calculateNewSpeed(cluster.posX, cluster.speedX, width);
  cluster.posX = calculateNewPosition(cluster.posX, cluster.speedX);
}

// Make cluster fall
void updateYPosition(Cluster cluster) {
  cluster.posY = calculateNewPosition(cluster.posY, cluster.speedY);
}

// Big reset
void BigReset() {
  timer = 0;
  cluster1.reset();
  cluster2.reset();
  cluster1.posY = startPosYAmount;
  cluster2.posY = startPosYAmount;
}

void displayMessageIfDown(int posY, int size, Cluster c) {
  int clusterBottom = posY + size / 2;
  
  if (clusterBottom > height) {
    println("A cluster is at the bottom." );
    c.hasHitTheButtom = true;
  }
}

// Same cluster size math as before
int calculateClusterSize(int speedY) {
  int baseSize = 30;
  int angle = 20;
  
  float sizeVariation = angle * sin(timer * speedY);
  float dynamicSize = baseSize + sizeVariation;

  return (int) dynamicSize;
}

// Same draw cluster function as before
void drawCluster(int posX, int posY, int size) {
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

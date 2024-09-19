// GDV_reus_de_bas_les4Practicum
// Basic = true
// Advanced = true
// Expert = true

// global vars
float timer;
final float timerAddAmount = 0.02f;
final float resetMargin = 3;
int startPosYAmount = -10;
final int two = 2;

// Cluster object to store properties for each cluster
class Cluster {
  int posX;
  int posY;
  int speedX;
  int speedY;
  boolean isGoingRight;
  boolean hasHitTheButtom;

  // Constructor to initialize a cluster with random values
  Cluster() {
    reset();
    posY = startPosYAmount;
  }

  // Reset the cluster with new random values
  void reset() {
    posX = (int) random(0, width);
    speedX = (int) random(1, 50);
    speedY = (int) random(1, 5);
    isGoingRight = true;
    hasHitTheButtom = false;
  }
}

// Create two cluster instances
Cluster cluster1 = new Cluster();
Cluster cluster2 = new Cluster();

void setup() {
  size(700, 1000);
}

void draw() {
  timer += timerAddAmount;
  background(#1e1e2e);

  updateAndDrawCluster(cluster1);
  updateAndDrawCluster(cluster2);

  // Reset when both clusters are off screen
  if (cluster1.posY > height * resetMargin 
      && cluster2.posY > height * resetMargin) {
    BigReset();
  }
}

// Function to update and draw a cluster
void updateAndDrawCluster(Cluster cluster) {
  updateXPosition(cluster);
  updateYPosition(cluster);
  
  // check if cluster hits bottum
  int clusterSize = calculateClusterSize(cluster.speedY);
  if (!cluster.hasHitTheButtom)
    displayMessageIfDown(cluster.posY, clusterSize, cluster);
  
  drawCluster(cluster.posX, cluster.posY, calculateClusterSize(cluster.speedY));
}

// Function to reset both clusters
void BigReset() {
  timer = 0;
  cluster1.reset();
  cluster2.reset();
  cluster1.posY = startPosYAmount;
  cluster2.posY = startPosYAmount;
}

// Function to update the x-position of a cluster
void updateXPosition(Cluster cluster) {
  // Check if cluster has hit the left or right boundaries
  if (cluster.posX >= width) {
    cluster.isGoingRight = false;
  } else if (cluster.posX <= 0) {
    cluster.isGoingRight = true;
  }

  // Update the x-position based on direction
  if (cluster.isGoingRight) {
    cluster.posX += cluster.speedX * timer;
  } else {
    cluster.posX -= cluster.speedX * timer;
  }
}


// Function to update the y-position of a cluster
void updateYPosition(Cluster cluster) {
  cluster.posY += timer * cluster.speedY;
}

// Function to display "I'm down" message if the bottom of the cluster goes off the screen
void displayMessageIfDown(int posY, int size, Cluster c) {
  // The bottom of the cluster is its position + half of its size
  int clusterBottom = posY + size / 2;
  
  if (clusterBottom > height) {
    println("A cluster is at the bottum." );
    c.hasHitTheButtom = true;
  }
}

// Function to calculate the dynamic size of the cluster
int calculateClusterSize(int speedY) {
  int baseSize = 30;
  int angle = 20; // This had a diffrent name like "gburbwsrovbnew" but I forgot what I used it for.
  
  // Size variation based on time and Y speed
  float sizeVariation = angle * sin(timer * speedY);
  float dynamicSize = baseSize + sizeVariation;

  return (int) dynamicSize;
}

// Function to draw the cluster (a square and circle)
void drawCluster(int posX, int posY, int size) {
  int radius = size / two;

  // Same size and placement math as last time
  float squareSize = size;
  float halfSquareSize = squareSize / two;

  float circleDiameter = radius * two;
  float circleSize = circleDiameter * timer;

  float leftCirclePositionX = posX - halfSquareSize - circleSize / two;

  // Draw the shapes
  fill(#a68ab7);
  rectMode(CENTER);
  square(posX, posY, squareSize);
  circle(leftCirclePositionX, posY, circleDiameter + circleSize);
}

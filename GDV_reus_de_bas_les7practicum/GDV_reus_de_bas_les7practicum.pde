// GDV_reus_de_bas_les7Practicum
// Basic = false
// Advanced = false
// Expert = false
// main script of the program.

// Playtester session 1: João Jubitana
// level 7
// level 5
// level 11
// feedback: Bug, 1 cluster ging lang muur trippen. Soms despawnen clusters te vroeg.

// Playtester session 2: João Jubitana
// level 4
// level 6
// level 5
// feedback: bugs komen niet meer voor. Bij de clusters is alleen de vierkant een hitbox maar ik exploid dat wel een beetje voor fun.

// gobal vars, some can't be changed
float timer;
boolean canTimeUpdate = true;
int levelCount = 1;
final float timerAddAmount = 0.02f;
final float resetMargin = 3.5;
final int two = 2;
PVector pos;

ArrayList<Cluster> clusters = new ArrayList<Cluster>();
Player player = new Player();

void setup() {
  size(1200, 1350);
  rectMode(CENTER);
  
  int randomClusersSize = (int) random(clusterAmountMin, clusterAmountMax);
  
  for (int i = 0; i < randomClusersSize; i = i+1) {
    // cluster needs a lot of numbers to work, maybe this would be better as a list.
    clusters.add(new Cluster(clusterSpeedVerticaleMin,
                             clusterSpeedVerticaleMax,
                             clusterSpeedHorizontalMin,
                             clusterSpeedHorizontalMax, 
                             startPositionVerticaleMaxAmount, 
                             startPositionVerticaleMinAmount));
  }
}

void draw() {
  // timer increasing and background drawing
  if (canTimeUpdate)
    timer += timerAddAmount;
  
  background(#1e1e2e);
  textSize(50); 
  UpdateText();

  // Moving player, only horizontal
  player.moveToMouse(false);

  // update and draw all clusters
  for (int i = clusters.size() - 1; i >= 0; i--) {
    updateAndDrawCluster(clusters.get(i));

    if (clusters.get(i).posY > height * resetMargin)
        //&& i == clusters.size()) {      
        BigReset();
  }
}

// Update position and draw cluster
void updateAndDrawCluster(Cluster cluster) {
  cluster.updateXPosition();
  cluster.updateYPosition();

  // Check if cluster is at the bottum
  float clusterSize = cluster.calculateSize(cluster.currentSpeedY);
  if (!cluster.hasHitTheButtom)
    displayMessageIfDown(cluster.posY, (int) clusterSize, cluster);

  // Check collision with the player
  if (checkCollisionWithPlayer(cluster, clusterSize))
    displayCollisionMessage();

  cluster.drawCluster(cluster.posX, cluster.posY, (int) clusterSize);
}

boolean checkCollisionWithPlayer(Cluster cluster, float clusterSize) {
  PVector playerPos = player.getPosition();
  int playerSize = player.getSize();

  // Check if the cluster's position overlaps with the player's position
  return (cluster.posX + clusterSize / two > playerPos.x - playerSize / two &&
          cluster.posX - clusterSize / two < playerPos.x + playerSize / two &&
          cluster.posY + clusterSize / two > playerPos.y - playerSize / two &&
          cluster.posY - clusterSize / two < playerPos.y + playerSize / two);
}

int collisionTime = -1;  // Variable to store the time of collision

void displayCollisionMessage() {
  // Display text when player gets hit by cluster
  fill(255, 0, 0);
  textSize(40);
  text("Cluster hit the player!", width / two - 200, height / 2);
  
  // Set the level to 0 upon collision
  levelCount = 0;

  // Record the time of collision
  if (collisionTime == -1)
    collisionTime = millis();

  // Check if 2 seconds (2000 milliseconds) have passed
  if (millis() - collisionTime >= 2000) {
    BigReset();
    collisionTime = -1;
  }
}


// Big reset
void BigReset() {
  timer = 0;
  levelCount++;
  UpdateText();
  
  for (int i = clusters.size() - 1; i >= 0; i--) {
    clusters.get(i).reset();
  }
}

void displayMessageIfDown(float posY, float size, Cluster c) {
  float clusterBottom = posY + size / 2;

  if (clusterBottom > height) {
    println("A cluster is at the bottom." );
    c.hasHitTheButtom = true;
  }
}

void UpdateText(){
  fill(0, 408, 612, 204);
  text("Level: " + levelCount, 10, 50);
}

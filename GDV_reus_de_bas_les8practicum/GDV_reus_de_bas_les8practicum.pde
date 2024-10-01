// GDV_reus_de_bas_les8Practicum
// basic = true
// advanced = true
// expert = false, dont want sound, so even blind people can play the game.
// main script of the program. Cluster are draw last, because I like it that the culster can go over the text.

// gobal vars, some can't be changed
float timer;
boolean canTimeUpdate = true;
boolean canDisplayHitText = false;
int levelCount = 1;
final float timerAddAmount = 0.02f;
final float resetMargin = 3.5;
final int two = 2;
int collisionTime = -1;
int amountClustersAtBottum;

// Instancete culsters list and player
ArrayList<Cluster> clusters = new ArrayList<Cluster>();
Player player;

void setup() {
  size(1200, 1300);
  rectMode(CENTER);
  player = new Player(playerStartHealth);
  
  int randomClusersSize = (int) random(clusterAmountMin, clusterAmountMax);
  
  for (int i = 0; i < randomClusersSize; i = i+1) {
    // cluster needs a lot of numbers to work, maybe this would be better as a list of int.
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

  // Draw player and its health
  fill(0, 408, 612, 204);
  player.drawPlayer();
  
  // if allowed, display text
  displayTheText();

  if (amountClustersAtBottum == clusters.size())
    ResetWithLevelIncrease();

  // update and draw all clusters
  for (int i = clusters.size() - 1; i >= 0; i--)
    updateAndDrawCluster(clusters.get(i));
}

// Update position and draw cluster
void updateAndDrawCluster(Cluster cluster) {
  cluster.updateXPosition();
  cluster.updateYPosition();

  // Check if cluster is at the bottum
  float clusterSize = cluster.calculateSize(cluster.currentSpeedY);
  if (!cluster.hasHitTheButtom
      && displayMessageIfDown(cluster.posY, (int) clusterSize, cluster) != 0){
      amountClustersAtBottum++;
  }

  // Check collision with the player
  if (checkCollisionWithPlayer(cluster, clusterSize))
  {
    player.decreaseHealth();
    displayCollisionMessage();
  }

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

void displayCollisionMessage() {
  canDisplayHitText = true;

  // Record the time of collision
  if (collisionTime == -1)
    collisionTime = millis();

  // Check if 2 seconds (2000 milliseconds) have passed
  if (millis() - collisionTime >= 2000)
  {
    collisionTime = -1;
    canDisplayHitText = false;
  }
}

float displayMessageIfDown(float posY, float size, Cluster c) {
  float clusterBottom = posY + size / 2;

  if (clusterBottom > height) {
    println("A cluster is at the bottom." );
    c.hasHitTheButtom = true;
    return c.posX;
  }
  
  return 0;
}

void UpdateText(){
  fill(255);
  text("Level: " + levelCount, 10, 50);
}

void displayTheText(){
  if (!canDisplayHitText)
    fill(#1e1e2e);
  else
    fill(255, 0, 0);
  
  // Display text when player gets hit by cluster
  textSize(40);
  text("Cluster hit the player!", width / two - 200, height / 2);
}

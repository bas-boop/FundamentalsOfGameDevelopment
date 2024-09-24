// GDV_reus_de_bas_les6Practicum
// Basic = true
// Advanced = true
// Expert = true

// gobal vars, that can bechanged for gameplay purposes
int clusterAmountMin = 2;
int clusterAmountMax = 6;
float clusterSpeedMin = 2;
float clusterSpeedMax = 6;

// gobal vars, some can't be changed
float timer;
final float timerAddAmount = 0.02f;
final float resetMargin = 3;
final int two = 2;
PVector pos;

ArrayList<Cluster> clusters = new ArrayList<Cluster>();
Player player = new Player();

void setup() {
  size(700, 1000);
  rectMode(CENTER);
  
  int randomClusersSize = (int) random(clusterAmountMin, clusterAmountMax);
  
  for (int i = 0; i < randomClusersSize; i = i+1) {
    clusters.add(new Cluster(clusterSpeedMin, clusterSpeedMax));
  }
}

void draw() {
  timer += timerAddAmount;
  background(#1e1e2e);

  player.moveToMouse(false);

  for (int i = clusters.size() - 1; i >= 0; i--) {
    updateAndDrawCluster(clusters.get(i));

    if (clusters.get(i).posY > height * resetMargin) {
      BigReset();
    }
  }
}

// Update position and draw cluster
void updateAndDrawCluster(Cluster cluster) {
  cluster.updateXPosition();
  cluster.updateYPosition();

  float clusterSize = cluster.calculateSize(cluster.currentSpeedY);
  if (!cluster.hasHitTheButtom)
    displayMessageIfDown(cluster.posY, (int) clusterSize, cluster);

  cluster.drawCluster(cluster.posX, cluster.posY, (int) clusterSize);
}

// Big reset
void BigReset() {
  timer = 0;
  
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

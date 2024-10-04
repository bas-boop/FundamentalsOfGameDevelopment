// GDV_reus_de_bas_toets
// Main script of the program. This is a simple game where you move a square and need to touch the moving nunmber in order.

// gobal vars, some can't be changed
float timer;
boolean canTimeUpdate = true;
boolean canDisplayHitText = false;
final float timerAddAmount = 0.02f;
final float resetMargin = 3.5;
final int two = 2;
final int textSize = 40;
int collisionTime = -1;
int amountClustersAtBottum;

// Instancete moving numbers list and player
ArrayList<MovingNumber> monvingNumbers = new ArrayList<MovingNumber>();
Player player;

void setup() {
  // program setup
  size(1000, 1000);
  rectMode(CENTER);
  textSize(textSize);
  
  player = new Player(playerStartHealth);
  
  // create and setup alle moving number
  for (int i = 0; i < amountOfNumbers; i = i+1) {
    monvingNumbers.add(new MovingNumber(i,
    (int) random(0 + textSize, height - textSize),
    movingNumberSpeedHorizontalMin,
    movingNumberSpeedHorizontalMax));
  }
}

void draw() {
  // timer increasing and background drawing
  if (canTimeUpdate)
    timer += timerAddAmount;
  
  background(#1e1e2e);

  // Draw player
  fill(0, 408, 612, 204);
  player.drawPlayer();
  
  // draw every moving number that still is alive
  for (int i = 0; i < monvingNumbers.size(); i = i+1) {
    monvingNumbers.get(i).drawMovingNumber();
  }
  
  calculateNumberCollision();
}

void calculateNumberCollision()
{
  // check if there is more then 0 numbers left, if not player has won
  if (monvingNumbers.size() < 1)
  {
    WinText();
    return;
  }
  
  // get the current target number to pick up
  MovingNumber currentNumberToCheck = monvingNumbers.get(player.currentNumberToPickup);
  
  // if colliding remove the first number, or in other words the lowest number
  if (checkCollisionWithPlayer(currentNumberToCheck.posX, currentNumberToCheck.posY, textSize))
    monvingNumbers.remove(0);
    
    
  for (int i = 1; i < monvingNumbers.size(); i = i+1) {
    MovingNumber otherMovingNumber = monvingNumbers.get(i);
    
    if (checkCollisionWithPlayer(otherMovingNumber.posX, otherMovingNumber.posY, textSize)){
      player.decreaseHealth();
    }
  }
}

// check via a postion of something is close to the player, if so return true otherwise false
boolean checkCollisionWithPlayer(float x, float y, float clusterSize) {
  PVector playerPos = player.getPosition();
  int playerSize = player.getSize();

  // Check if the objects' position overlaps with the player's position
  return (x + clusterSize / two > playerPos.x - playerSize / two &&
          x - clusterSize / two < playerPos.x + playerSize / two &&
          y + clusterSize / two > playerPos.y - playerSize / two &&
          y - clusterSize / two < playerPos.y + playerSize / two);
}

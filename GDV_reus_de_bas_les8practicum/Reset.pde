// A collection of reset functions

// Big reset
void BigReset() {
  timer = 0;
  amountClustersAtBottum = 0;
  canDisplayHitText = false;
  levelCount = 1;
  UpdateText();
  player.health = playerStartHealth;

  for (int i = clusters.size() - 1; i >= 0; i--) {
    clusters.get(i).reset();
  }
}

void ResetWithLevelIncrease(){
  timer = 0;
  amountClustersAtBottum = 0;
  canDisplayHitText = false;
  levelCount++;
  UpdateText();

  for (int i = clusters.size() - 1; i >= 0; i--) {
    clusters.get(i).reset();
  }
}

// Will stop the the form updating and show the game over text;
void LoseCondition() {
  canTimeUpdate = false;
  GameOverText();
  player.health = 0;

  noLoop();
}

void GameOverText(){
  fill(255, 0, 0);
  text("You have lost the game!\n\nThe number that you should have touched was " + player.currentNumberToPickup + "!\nRetart the via closing and opening the game.",
        textSize,
        height / 2);
}

void WinText(){
  fill(0, 255, 0);
  text("You have won the game!\n\nYou have touched every number in order!\nRetart the via closing and opening the game.",
        textSize,
        height / 2);
}

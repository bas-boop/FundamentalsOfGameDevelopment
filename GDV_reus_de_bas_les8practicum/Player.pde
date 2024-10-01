class Player {
  PVector position;
  int size = 50;
  // time in milliseconds that the player can't be hit
  int cantBeHitTime;
  // last time the player was hit
  int lastHitTime;
  int health;

  // Constructor for the Player class
  Player(int targetHealth) {
    position = new PVector(width / 2, height - size);
    health = targetHealth;
    cantBeHitTime = 2000;  // 2 seconds of invulnerability
    lastHitTime = -cantBeHitTime; // Initialized so the player can be hit immediately
  }

  // Main method to draw the player and handle logic
  void drawPlayer(){
    moveToMouse(false);
    drawHealth();
  }

  // Move player to the mouse, with option to only follow mouse horizontally
  void moveToMouse(boolean followMouseY) {
    position.x = mouseX;
    position.y = followMouseY ? mouseY : height - size;

    // Draw the player
    square(position.x, position.y, size);
  }

  // Draw the player's health on screen
  void drawHealth(){
    text("Health: " + health, 10, 100);
  }
  
  // Decrease health only if enough time has passed since the last hit
  void decreaseHealth(){
    int currentTime = millis(); // Get the current time in milliseconds
    
    // Check if enough time has passed since the last hit
    if (currentTime - lastHitTime >= cantBeHitTime) {
      health -= 1;
      lastHitTime = currentTime; // Reset the last hit time
    }
    
    if (player.health <= 0)
      BigReset();
  }

  // Get the position of the player for collision detection
  PVector getPosition() {
    return position;
  }

  // Get the size of the player for collision detection
  int getSize() {
    return size;
  }
}

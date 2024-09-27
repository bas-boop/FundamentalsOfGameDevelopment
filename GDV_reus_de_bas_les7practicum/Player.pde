class Player {
  PVector position;
  int size = 50;

  Player() {
    position = new PVector(width / 2, height - size);
  }

  // Move square to the mouse, option to only follow mouse horizantaly
  void moveToMouse(boolean followMouseY) {
    player.position.x = mouseX;
    player.position.y = followMouseY
      ? mouseY
      : height - size;

    square(player.position.x, player.position.y, 100);
  }
  
  // Get the bounds of the player for collision detection
  PVector getPosition() {
    return position;
  }

  int getSize() {
    return size;
  }
}

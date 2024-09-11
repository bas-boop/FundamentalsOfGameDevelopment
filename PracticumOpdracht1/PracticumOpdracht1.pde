// Practicum Opdracht 1, door Bas de Reus
// basic true
// advanced true
// expert false

void setup(){
  size(700, 500);
  background(0);
  squares();
  cricleSquareCricle();
  circlesWithMath();
}

// the function for the first 3 squars that are top left of the screen
void squares(){
  
  // initialize the varibles
  int amount = 3;
  int x = 0;
  int y = 0;
  int size = 50;
  
  fill(255);
  
  // for loop to place the square and add the size to the position
  for (int i = 0; i < amount; i++) {
    square(x, y, size);
    
    if (i < amount - 1){
      x += size;
      y += size;
    }
  }
}

void cricleSquareCricle(){
  
  // initialize the varibles
  int x = 400;
  int y = 300;
  int size = 50;
  int radius = 25;
  
  fill(49, 222, 104);
  
  // placing square and circles with some math
  square(x - radius, y - radius, size);
  circle(x - size, y, radius * 2);
  circle(x + size, y, radius * 2);
}

void circlesWithMath(){
  // initialize the variables
  PVector position = new PVector(200, 400);
  int diameter = 50; // also used as distance
  
  // color and draw the start circle
  fill(255, 0, 135);
  circle(position.x, position.y, diameter);
  
  placeCircleAngle(45, diameter, position);
  placeCircleAngle(170, diameter, position);
}

void placeCircleAngle(int angele, float diameter, PVector position){
  
  // Convert degrees to radians
  float gneownbgl = -radians(angele);
  PVector offset = position;
  
  // using the angele for x and y offset
  offset = new PVector(cos(gneownbgl) * diameter,
                       sin(gneownbgl) * diameter);
                       
  circle(position.x + offset.x, position.y + offset.y, diameter);
}

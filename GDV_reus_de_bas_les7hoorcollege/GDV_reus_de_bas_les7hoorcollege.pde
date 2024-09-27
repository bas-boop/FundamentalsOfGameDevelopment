// GDV_reus_de_bas_les7hoorcollege

ArrayList listOfStuff = new ArrayList();

class ourList{
  ArrayList our = new ArrayList();
  int lenght;
  
  ourList(int number){
    lenght = number;
    
    for (int i = 0; i < number; i = i+1) {
      our.add((int) random(0, 100));
      println("Added new number: " + our.get(i));
    }
  }
  
  int getRandom(){
    return (int) our.get((int) random(0, lenght));
  }
}

ourList pataje = new ourList(50);

void setup(){
  println("What is in the list: " + listOfStuff);
  
  for (int i = 0; i < 10; i = i+1) {
    listOfStuff.add((int) random(0, 100));
    println("Added new number: " + listOfStuff.get(i));
  }
  
  println("What is in the list now: " + listOfStuff);
}

void draw(){
  println(listOfStuff.get(listOfStuff.size() - 1));
  int l = listOfStuff.size() - 2;
  
  for (int i = 0; i < l; i++) {
    println(listOfStuff.get(i));
  }
  
  println("Random number form pataje: " + pataje.getRandom());
}

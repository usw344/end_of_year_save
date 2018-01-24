int[] ourList = {5, 15, 3, 8, 9, 1, 20, 7};
boolean done = false;

void bubbleSort(int[] someList) {
  
  for (int currentNumber = 0; currentNumber < someList.length - 1; currentNumber ++) {
    if(done){
      currentNumber = someList.length;    
    }
    else if (someList[currentNumber] > someList[currentNumber + 1]) {
      done = false;
      int tempNum = someList[currentNumber];
      someList[currentNumber] = someList[currentNumber + 1];
      someList[currentNumber + 1] = tempNum;
      println(someList);
      println();
      bubbleSort(someList);
    }
    else {
      done = true;
    
    }
}
}




void setup() {
  bubbleSort(ourList);
  println(ourList);
}


void draw() {
}
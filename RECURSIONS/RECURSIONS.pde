

void setup() {
  for(int i = 0; i <20; i++) {
    
  println(factorial(16));
  }

}

void draw() {


}


int factorial(int n) {
  //base case or exit clause (mean same thing)
  if(n== 1) {
    return 1;
  }
  //pattern
  else{
    return n * factorial(n-1);
  }

}
/// Muhammad Ahmed Comp sci 30 final, interactive mascot
// built my Linux air inc
// can be used as open source code, (the mit licence or the openest you can find)

//////WARNING we are not responsible for any damge or grivence this code may cause, use at own risk

/// the code was tested 50 time fo bugs. If you get a null pointer go to line 4 and change the 3 to 2


// how to play this game 

// you are controlled by mouse (mouse event)

// the ai mascot will shot balls at you, you have to keep out of its way (automatic movment)

// if you want to make it harder press """""g""""""""" and the dudes in the background will start moving. So it makes it harder to see (keyMovement)
// dont die

mascot[] m1;
int state;
boolean isKey, isMouse, isAi;

float time;

void setup(){
  size(800,800);

  state = 1;
  
  /// this is a fail safe to ensure that we get one of each
  isKey = false;
  isMouse = false;
  isAi = false;
  
  // making a random sized array  
  m1 = new mascot[int(random(7,8))];
  
  int choice;// to see which one it should draw
  
  for(int i = 0; i < m1.length; i ++){
    choice  = int(random(1,3));// only picks between ai and key (although it seems to always pick 1)
    println(choice);
    
    
    float randomSpeed = random(5,10);// use a random speed each time
    
    
    if(choice == 1){// if it says make a key contolled masc.
      m1[i] = new mascot(random(100,300),random(100,200),1,"raptors-l.png","raptors-r.png",randomSpeed);// to see what each paramter is see class Mascot constructor
      
      
      isKey = true;// tell it that we have one of these
    }
    
    
    else if(choice == 2){
      m1[i] = new mascot(random(50,400),200,3,"warriors-l.png","warriors-r.png",randomSpeed);
      
      isAi = true;
    }
  }
    
    
    
    
    
  ////////// end of that for loop  
  
 
  /// very boring part but, this is the fail safe. Checks to see if we have bare minimum of each
  if(isKey == false){
    m1[0] = new mascot(200,200,1,"raptors-l.png","raptors-r.png",random(5,12)); 
    }
  
  if(isMouse == false){
    m1[1] = new mascot(width/2,height/2,2,"spurs-l.png","spurs-r.png",0);
    }
  
  if(isAi == false){
    m1[2] = new mascot(200,200,3,"warriors-l.png","warriors-r.png",6);
    m1[3] = new mascot(600,200,3,"warriors-l.png","warriors-r.png",10);
    
    }



  

}


void draw(){
  background(255);
  
  if(state == 1){// game section
    time = millis();
    for(int i = 0; i < m1.length; i ++){
      m1[i].display();// show the mascots
      m1[i].movement();  // the main code, does EVERTHING
    }
  }
  else if(state == 2){
    int finalTime = 0;
    background(0);// end of game 
    fill(255);
    finalTime = int(time/1000);// calc up the final time
    
    textSize(35);
    text("lol you lost but, you survived for: " + finalTime + "s", width/6, height/2);
  
  
  }




}
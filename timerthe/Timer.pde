class Timer {
  int totalTime, howLongDoYouWait, timeStart;
  int timeState, nowTime, pauseTime;
  
  Timer(int _totalTime, int _howLongDoYouWait) {
    totalTime = _totalTime;
    howLongDoYouWait = _totalTime;
    nowTime = millis();
    timeState = 0;
  
  
  
  }
  void begin() {
    if (timeState == 0) {
      fill(255);
      nowTime = millis()/1000; // in sec
      textSize(40);
      text(nowTime, width/2, height/2);
    }
  
  }
  void pause() {
    if (timeState == 1) {
      nowTime = pauseTime;
      timeState = 2;
  }
    if (timeState == 2) {
      text(pauseTime + "timer is pause", width/2, height/2);      
    
    
    
    }
  }
  void keyPressed() {
    if (key == 'w') {
    timeState = 1;
    }
  
  }



}
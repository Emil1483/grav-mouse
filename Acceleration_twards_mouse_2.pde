Planet[] planet;

float targetMass;

float avgFps = 0;
float totalF;

void setup() {
  fullScreen(P2D, 2);
  background(0);
  frameRate(60);
  planet = new Planet[21000];
  for(int i = 0; i < planet.length; i++) {
    planet[i] = new Planet(round(random(1, 2)), round(random(255)), round(random(255)), round(random(255)));
  }
  
}



void draw() {
  totalF += frameRate;
  avgFps = totalF/frameCount;
  
  background(0);
 // text(round(avgFps), 10, 10);
  //text(round(frameRate), 10, 30);

  for(Planet p : planet) {
    
    
    if(mousePressed) {
      if(mouseButton == LEFT) {
        targetMass = 4 * pow(10, 13);
      } else if (mouseButton == RIGHT) {
        targetMass = 1 * pow(10, 14);
      }
    } else {
      targetMass = 2 * pow(10, 12);
    }
    if(keyPressed) {
      if(key == ' '){
        targetMass = -6 * pow(10, 13);
      } else if (key == 'r' || key == 'R') {
        p.reset();
      }
    }
    
    

    
    
    p.update();
  }

}
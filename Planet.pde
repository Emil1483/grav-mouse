class Planet {
  float s = random(TWO_PI);
  float off = random(5, 60);
  PVector pos = new PVector(map((cos(s)), -1, 1, width/3 + 100, 2*width/3 - 100) + random(-off, off), map((sin(s)), -1, 1, height/3, 2*height/3) + random(-off, off));
  PVector target = new PVector();
  PVector diff = new PVector();
  PVector velocity = new PVector();
  
  float mass;
  float Distance;
  float force;
  PVector acceleration = new PVector();
  int size;
  float minDistance;
  float maxSpeed = 4;
  float speed;
  int a;
  int r;
  int b;
  
  Planet(int size_, int r_, int g_, int b_) {
    size = size_;
    mass = size*200;
    minDistance = 20;
    r = r_;
    a = g_;
    b = b_;
  }
  
  
  
  void reset() {
    off = random(5, 60);
    pos.set(map((cos(s)), -1, 1, width/3 + 100, 2*width/3 - 100) + random(-off, off), map((sin(s)), -1, 1, height/3, 2*height/3) + random(-off, off));
    velocity.set(0, 0);
  }
  

  
    void update() {
      
    //Speed vs MaxSpeed
    speed = sqrt(sq(velocity.x) + sq(velocity.y));
    if (speed > maxSpeed) {
      velocity.mult(0.9);
    }
    
    
      
    
    
    target.x = mouseX;       //Uppdate
    target.y = mouseY;
    Distance = (sqrt((target.x - pos.x)*(target.x - pos.x) + (target.y - pos.y)*(target.y - pos.y)));
    diff.y = target.y - pos.y;
    diff.x = target.x - pos.x;
    
    if (Distance < minDistance) { //Distance vs minDistance
      Distance = minDistance;
      if (mousePressed && mouseButton == LEFT){
        pos.x = target.x;
        pos.y = target.y;
      }
    }
    
    


    

    
    force = 6.67408*pow(10, -11) * targetMass * mass / sq(Distance);
    acceleration.set(diff);
    acceleration.normalize();
    acceleration.setMag(force);
    acceleration.div(mass);
    velocity.add(acceleration);
    pos.add(velocity);
    
    
    if (pos.x > width) { //edges
        pos.x = width;
        velocity.x /= -2;
      } else if (pos.x < 0) {
        pos.x = 0;
        velocity.x /= -2;
      } else if (pos.y > height) {
        pos.y = height;       
        velocity.y /= -2;
      } else if (pos.y < 0) {
        pos.y = 0;
        velocity.y /= -2;
      }
    
    stroke(r, a, b); //Show
    point(pos.x, pos.y);
  }
}
/**
 Newton's 2nd Law : mass * acceleration = Force (Mass times Acceleration equals Force.)
 and In the world of Processing, mass = 1 so that Acceleration = F 
 
 Location is adjusted by Velocity.
 Velocity is adjusted by Acceleration(equal to force, where it all begins) **/

int num = 10;
Mover[] m = new Mover[num];
color[] c = new color[num];

void setup() {
  size(640, 360);
  for (int i = 0; i <num; i++) {
    m[i] = new Mover(random(0.1,5),0,0);
    c[i]= color(random(255), random(255), random(255), 90);
  }
}

void draw() {
  background(255);

  for (int i = 0; i <num; i++) {
    if (mousePressed) {
      PVector wind = new PVector(0.3, 0);
      PVector gravity = new PVector(0, 0.1);
      m[i].applyForce(wind);// The wind value applies to the function of applyForce. 
      m[i].applyForce(gravity);
    }

    fill(c[i]);
    m[i].update();
    m[i].display();
    m[i].checkEdge();
  }
}
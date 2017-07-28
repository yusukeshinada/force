/**
 The goal is able to add forces to objects
 m.applyForce(wind(on X axis) or gravity(on Y axis));
 Acceleration = Force/mass
 
 1. Location is adjusted by Velocity.
 Location = velocity*time
 2. Velocity is adjusted by Acceleration(equal to force, where it all begins)
 Velocity = V0 + Acceleration*time
 **/
class Mover {

  PVector location; // location = velocity * time
  PVector velocity; // veloctity = V0 + acceleration * time
  PVector acceleration;
  float mass; 

  Mover(float m, float x, float y){
    mass = m; //Set the initial value.
    location = new PVector(x, y);
    velocity = new PVector(0, 0); //In the state of the stoping at 0 frame.
    acceleration = new PVector(0, 0); //Initialized at 0 values.
  }

  void applyForce(PVector force) {
    //acceleration = force;
    //However Mass would work as a scalar if it apperes with accel.
    // Acceleration = Force/mass
    force.div(mass);
    acceleration.add(force);// Acceleration = new PVector(0,0) + PVector force(?, ?)
    //PVector f = new PVector(force, mass)
    //acceleration.add(f)
  }

  void update() {
    // it is always excuted every single times.
    velocity.add(acceleration);
    location.add(velocity); 
    acceleration.mult(0);
  }

  void display() {
     strokeWeight(0.5);
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdge() {
    if (location.x > width - mass*16/2) {
      location.x = width - mass*16/2;
      velocity.x *= -1;
    } else if (location.x < mass*16/2) {
      location.x = mass*16/2;
      velocity.x *= -1;
    }
    if (location.y > height - mass*16/2) {
      location.y = height - mass*16/2;
      velocity.y *= -1;
    }
  }
}
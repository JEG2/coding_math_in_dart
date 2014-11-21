import "vector.dart";

class Particle {
  Vector position;
  Vector velocity;
  Vector gravity;

  Particle(num x, num y, num speed, num direction, [num grav = 0]) {
    position        = new Vector(x, y);
    velocity        = new Vector(0, 0);
    velocity.length = speed;
    velocity.angle  = direction;
    gravity         = new Vector(0, grav);
  }

  void update() {
    velocity.addTo(gravity);
    position.addTo(velocity);
  }

  void accelerate(Vector acceleration) {
    velocity.addTo(acceleration);
  }
}
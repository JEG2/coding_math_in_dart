import "vector.dart";

class Particle {
  Vector position;
  Vector velocity;

  Particle(x, y, speed, direction) {
    position        = new Vector(x, y);
    velocity        = new Vector(0, 0);
    velocity.length = speed;
    velocity.angle  = direction;
  }

  void update() {
    position.addTo(velocity);
  }
}
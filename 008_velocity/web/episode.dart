import "dart:html";
import "dart:math";

import "particle.dart";

var canvas    = querySelector("#screen");
var context   = canvas.getContext("2d");
var width     = window.innerWidth;
var height    = window.innerHeight;
var particles = new List();
var rng       = new Random();

void update([num delta]) {
  context.clearRect(0, 0, width, height);

  particles.forEach( (particle) {
    particle.update();

    context.beginPath();
    context.arc(particle.position.x, particle.position.y, 10, 0, PI * 2, false);
    context.fill();
  } );

  window.animationFrame.then(update);
}

void main() {
  canvas.width  = width;
  canvas.height = height;

  for (var i = 0; i < 100; i++) {
    particles.add(
        new Particle( width  ~/ 2,
                      height ~/ 2,
                      rng.nextDouble() * 4 + 1,
                      rng.nextDouble() * PI * 2 )
    );
  }

  update();
}

import "dart:html";
import "dart:math";

import "particle.dart";
import "vector.dart";

var canvas       = querySelector("#screen");
var context      = canvas.getContext("2d");
var width        = window.innerWidth;
var height       = window.innerHeight;
var ship         = new Particle(width ~/ 2, height ~/ 2, 0, 0);
var thrust       = new Vector(0, 0);
var angle        = 0;
var turningLeft  = false;
var turningRight = false;
var thrusting    = false;

void update([num delta]) {
  context.clearRect(0, 0, width, height);

  if (turningLeft) {
    angle -= 0.05;
  }
  if (turningRight) {
    angle += 0.05;
  }

  thrust.angle = angle;

  if (thrusting) {
    thrust.length = 0.1;
  } else {
    thrust.length = 0;
  }

  ship.accelerate(thrust);
  ship.update();

  context.save();
  context.translate(ship.position.x, ship.position.y);
  context.rotate(angle);

  context.beginPath();
  context.moveTo(10, 0);
  context.lineTo(-10, -7);
  context.lineTo(-10, 7);
  context.lineTo(10, 0);
  if(thrusting) {
    context.moveTo(-10, 0);
    context.lineTo(-18, 0);
  }
  context.stroke();

  context.restore();

  if(ship.position.x > width) {
    ship.position.x = 0;
  }
  if(ship.position.x < 0) {
    ship.position.x = width;
  }
  if(ship.position.y > height) {
    ship.position.y = 0;
  }
  if(ship.position.y < 0) {
    ship.position.y = height;
  }

  window.animationFrame.then(update);
}

void main() {
  canvas.width  = width;
  canvas.height = height;

  window.onKeyDown.listen( (event) {
    switch (event.keyCode) {
      case 37:
        turningLeft = true;
        break;
      case 38:
        thrusting = true;
        break;
      case 39:
        turningRight = true;
        break;
    }
  } );
  window.onKeyUp.listen( (event) {
    switch (event.keyCode) {
      case 37:
        turningLeft = false;
        break;
      case 38:
        thrusting = false;
        break;
      case 39:
        turningRight = false;
        break;
    }
  } );

  update();
}

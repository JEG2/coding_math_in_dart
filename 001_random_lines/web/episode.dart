import "dart:html";
import "dart:math";

void main() {
  var canvas  = querySelector("#screen");
  var context = canvas.getContext("2d");
  var width   = window.innerWidth;
  var height  = window.innerHeight;

  canvas.width  = width;
  canvas.height = height;

  var rng = new Random();

  for (var i = 0; i < 100; i++) {
    context.beginPath();
    context.moveTo(rng.nextDouble() * width, rng.nextDouble() * height);
    context.lineTo(rng.nextDouble() * width, rng.nextDouble() * height);
    context.stroke();
  }
}

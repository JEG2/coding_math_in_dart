import "dart:html";
import "dart:math";

void main() {
  var canvas  = querySelector("#screen");
  var context = canvas.getContext("2d");
  var width   = window.innerWidth;
  var height  = window.innerHeight;

  canvas.width  = width;
  canvas.height = height;

  context.translate(0, height / 2);
  context.scale(1, -1);
  for (var angle = 0; angle < PI * 2; angle += 0.01) {
    var x = angle * 200;
    var y = sin(angle) * 200;

    context.fillRect(x, y, 5, 5);
  }
}

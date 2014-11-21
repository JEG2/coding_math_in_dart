import "dart:html";
import "dart:math";

var canvas  = querySelector("#screen");
var context = canvas.getContext("2d");
var width   = window.innerWidth;
var height  = window.innerHeight;
var arrowX  = width  ~/ 2;
var arrowY  = height ~/ 2;
var angle   = 0;

void render([num delta]) {
  context.clearRect(0, 0, width, height);

  context.save();
  context.translate(arrowX, arrowY);
  context.rotate(angle);

  context.beginPath();
  context.moveTo(20, 0);
  context.lineTo(-20, 0);
  context.moveTo(20, 0);
  context.lineTo(10, -10);
  context.moveTo(20, 0);
  context.lineTo(10, 10);
  context.stroke();

  context.restore();

  window.animationFrame.then(render);
}

void adjustAngle(MouseEvent event) {
  var dx = event.client.x - arrowX;
  var dy = event.client.y - arrowY;
  angle  = atan2(dy, dx);
}

void main() {
  canvas.width  = width;
  canvas.height = height;

  window.onMouseMove.listen(adjustAngle);

  render();
}

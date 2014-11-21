import "dart:html";
import "dart:math";

var canvas  = querySelector("#screen");
var context = canvas.getContext("2d");
var width   = window.innerWidth;
var height  = window.innerHeight;

var centerX    = width  ~/ 2;
var centerY    = height ~/ 2;
var radius     = 200;
var xRadius    = 200;
var yRadius    = 400;
var angle      = 0;
var xAngle     = 0;
var yAngle     = 0;
var speed      = 0.01;
var xSpeed     = 0.1;
var ySpeed     = 0.131;
var numObjects = 20;
var slice      = PI * 2 / numObjects;

void render([num delta]) {
  context.clearRect(0, 0, width, height);

  renderCirlce();
  renderEllipse();
  renderLissajousCurve();
  renderObjects();

  window.animationFrame.then(render);
}

void renderCirlce() {
  var x = centerX + cos(angle) * radius;
  var y = centerY + sin(angle) * radius;
  context.beginPath();
  context.arc(x, y, 10, 0, PI * 2, false);
  context.fill();
}

void renderEllipse() {
  var x = centerX + cos(angle) * xRadius;
  var y = centerY + sin(angle) * yRadius;
  context.beginPath();
  context.arc(x, y, 10, 0, PI * 2, false);
  context.fill();

  angle += speed;
}

void renderLissajousCurve() {
  var x = centerX + cos(xAngle) * xRadius;
  var y = centerY + sin(yAngle) * yRadius;
  context.beginPath();
  context.arc(x, y, 10, 0, PI * 2, false);
  context.fill();

  xAngle += xSpeed;
  yAngle += ySpeed;
}

void renderObjects() {
  for (var a = 0; a < numObjects; a += slice) {
    var x = centerX + cos(a) * radius;
    var y = centerY + sin(a) * radius;
    context.beginPath();
    context.arc(x, y, 10, 0, PI * 2, false);
    context.fill();
  }
}

void main() {
  canvas.width  = width;
  canvas.height = height;

  render();
}

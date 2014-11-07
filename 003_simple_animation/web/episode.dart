import "dart:html";
import "dart:math";

var canvas  = querySelector("#screen");
var context = canvas.getContext("2d");
var width   = window.innerWidth;
var height  = window.innerHeight;

var centerX    = width  * 0.5;
var centerY    = height * 0.5;
var baseRadius = 100;
var baseAlpha  = 0.5;
var speed      = 0.1;
var angle      = 0;

void render([num delta]) {
  context.clearRect(0, 0, width, height);
  context.fillStyle = "rgba(0, 0, 0, 1)";

  renderMotion();
  renderResize();
  renderFade();

  angle += speed;

  window.animationFrame.then(render);
}

void renderMotion() {
  var y = centerY + sin(angle) * (height * 0.4);

  context.beginPath();
  context.arc(centerX, y, 50, 0, PI * 2, false);
  context.fill();
}

void renderResize() {
  var radius = baseRadius + sin(angle) * 50;

  context.beginPath();
  context.arc(centerX / 2, centerY, radius, 0, PI * 2, false);
  context.fill();
}

void renderFade() {
  var alpha = baseAlpha + sin(angle) * 0.5;

  context.fillStyle = "rgba(0, 0, 0, ${alpha})";
  context.beginPath();
  context.arc(centerX + centerX / 2, centerY, 50, 0, PI * 2, false);
  context.fill();
}

void main() {
  canvas.width  = width;
  canvas.height = height;

  render();
}

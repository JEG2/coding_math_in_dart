import "dart:html";
import "dart:math";

class Vector {
  num x;
  num y;

  Vector(this.x, this.y);

  Vector.unit() : this(1, 0);

  num get angle => atan2(y, x);

  void set angle(num value) {
    var l = length;
    x     = cos(value) * l;
    y     = sin(value) * l;
  }

  num get length => sqrt(x * x + y * y);

  void set length(num value) {
    var a = angle;
    x     = cos(a) * value;
    y     = sin(a) * value;
  }

  Vector operator +(Vector other) => new Vector(x + other.x, y + other.y);
  Vector operator -(Vector other) => new Vector(x - other.x, y - other.y);

  Vector operator *(num scalar) => new Vector(x * scalar, y * scalar);
  Vector operator /(num scalar) => new Vector(x / scalar, y / scalar);

  void addTo(Vector other) {
    x += other.x;
    y += other.y;
  }

  void subtractFrom(Vector other) {
    x -= other.x;
    y -= other.y;
  }

  void multiplyBy(num scalar) {
    x *= scalar;
    y *= scalar;
  }

  void divideBy(num scalar) {
    x /= scalar;
    y /= scalar;
  }
}

void main() {
  var v1 = new Vector(10, 5);
  var v2 = new Vector(3, 4);
  var v3 = v1 * 2;

  print(v3.x);
  print(v3.y);
  print(v3.angle);
  print(v3.length);
}

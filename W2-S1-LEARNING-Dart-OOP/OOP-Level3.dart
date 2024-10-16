// Creat a class Shape 
// Use named parameters
// Use nullable types
// Use getters for dynamic properties

class Point{
  final int _x;
  final int _y;

  Point(this._x, this._y);

  @override
  String toString(){
    return "x = $_x - y = $_y";
  }
  Point translate(int dx, int dy){
    return Point(_x + dx, _y + dy);
  }
  get x => _x;
  get y => _y;
}
enum Color{ blue, red, green, yellow }

class Shape{
  final Point leftBottom;
  final int width;
  final int height;
  Color? backgroundColor;

  Shape({
    required this.leftBottom,
    required this.width,
    required this.height,
    this.backgroundColor // (optional) If no value is provided, it will default to null
  });
  // Getter to calculate the top-right point of the shape\
  // rightTop getter recalculates the top-right point every time it’s accessed based on the current leftBottom, width, and height
  Point get rightTop => Point(leftBottom.x + width, leftBottom.y + height);

}
void main() {
  // Example usage
  Point bottomLeft = Point(0, 0);
  Shape rectangle = Shape(
    leftBottom: bottomLeft,
    height: 5,
    width: 10,
    backgroundColor: Color.blue,
  );

  print(rectangle.leftBottom); // Output: x = 0 - y = 0
  print(rectangle.rightTop); // Output: x = 10 - y = 5
  print("Background color: ${rectangle.backgroundColor}"); // Output: Background color: Color.blue
}
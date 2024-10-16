// Make your Point immutable!!!

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
  // can access the values of x, y from outside the class
}

main(){
  Point p1 = Point(2, 3);
  print(p1);
  Point p2 = p1.translate(1, 1);
  print(p2); 
  //  the original point p1 remains unchanged at (2, 3), /
  //  while the new point p2 represents a different point at (3, 4).
}
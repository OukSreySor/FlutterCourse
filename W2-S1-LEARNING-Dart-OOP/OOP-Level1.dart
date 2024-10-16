// Create class Point
// A point has a X and Y position
// The class should provide a method to translate the point(dx, dy)
class Point{
  int x;
  int y;
  //  // Constructor to create and initialize the Point object
  Point(this.x, this.y);

  @override
  String toString(){
    return "x = $x - y = $y";
  }
  void translate(int dx, int dy){
    x+=dx;
    y+=dy;
  }
  
}
main(){
  Point p1 = Point (5, 6);  // Constructor is called here
  Point p2 = new Point (4, 7); //new is optional
  print(p1);
  print(p2);
  p1.translate(3, 10);
  p2.x = 8;  // we can change x, y attribute freely
  p2.y = 3;
  print(p1);
  print(p2);
  
  // this way u don't need to override toString
  // Point p = Point (2, 3); 
  // print('x = ${p.x} , y = ${p.y}');
  // p.translate(1,1);
  // print('x = ${p.x} , y = ${p.y}');  

}

// Create a class Distance
// Use named constructors
// Use getters
// Use operator overloading

class Distance{
  final double _kms;
  final double _meters;
  final double _cms;

  Distance(this._kms, this._meters, this._cms);

  //Named constructor
  Distance.kms(double kilometers):
    _kms = kilometers,
    _meters = kilometers * 1000,
    _cms = kilometers * 100000;
  Distance.meters(double meters):
    _kms = meters / 1000,
    _meters = meters,
    _cms = meters * 100;
  Distance.cms(double centimeter): 
    _kms = centimeter / 100000,
    _meters = centimeter / 100,
    _cms = centimeter;

  double get kms => this._kms;
  double get meters => this._meters;
  double get cms => this._cms;

  @override
  String toString(){
    return "Kilometer: ${_kms}\nMeter: ${_meters}\nCentimeter: ${_cms}";
  }

  // Overload the + operator to add distances
  Distance operator + (Distance other){
    return Distance(_kms + other._kms, _meters + other._meters, _cms + other._cms);
  }
}

void main(){
  Distance d1 = Distance.cms(1000);
  Distance d2 = Distance.meters(1000);
  Distance d3 = d1 + d2;
  print(d3);
  
}
// Reference: https://hussainmustafa.com/operator-overloading-in-dart-a-comprehensive-guide/
// Key Concepts of Operator Overloading in Dart:
// 1. Operator Methods: Special methods are defined in your class to overload specific operators.
// 2. Syntax:           Operator methods are defined using the operator keyword followed by the operator symbol.
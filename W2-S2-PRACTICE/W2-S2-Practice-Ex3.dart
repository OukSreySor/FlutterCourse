class MyDuration {
  final int _milliseconds;

  MyDuration({required int duration_in_milisec}): _milliseconds = duration_in_milisec;

  int get duration_in_milisec => this._milliseconds;

  MyDuration.fromHours(int hours) : this(duration_in_milisec:  hours * 3600000);
  MyDuration.fromMinutes(int minutes) : this(duration_in_milisec:  minutes * 60000);
  MyDuration.fromSeconds(int seconds) : this(duration_in_milisec:  seconds * 1000);

  MyDuration operator + (MyDuration other) {
    return MyDuration(duration_in_milisec: duration_in_milisec + other._milliseconds);
  }
  MyDuration operator - (MyDuration other) {
    try{
      if (duration_in_milisec - other._milliseconds < 0){
        throw ('The duration must be greater or equal 0');
      }
      else{
        return MyDuration(duration_in_milisec: duration_in_milisec - other._milliseconds);
      }
    }catch(e) {
      print(e);    
    }
    return MyDuration(duration_in_milisec: 0); // Return a default value (0 milliseconds)
  }
  
  bool operator > (MyDuration other) {
    return (duration_in_milisec > other._milliseconds);
  }
  double get hours => _milliseconds / 3600000;
  double get minutes => _milliseconds / 60000;
  double get seconds => _milliseconds / 1000;
  
//   // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {

    MyDuration duration1 = MyDuration.fromHours(3); 
    print(duration1);
    MyDuration duration2 = MyDuration.fromMinutes(45); 
    print(duration1 + duration2); 
    print(duration1 > duration2); 

    try {
      print(duration2 - duration1); 
    } catch (e) {
      print(e); 
    }
  
}
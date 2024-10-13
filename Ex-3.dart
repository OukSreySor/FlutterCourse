void main(){
  //List of student scores
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  List<int> result = [];
  for (int score in scores){
    if (score >=50){
      result.add(score);
    }
  }
  print(result);
}
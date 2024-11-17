
class JokeData {
  final String title;
  final String description;
  
  
  JokeData(
      {required this.title, required this.description});
}

List<JokeData> jokes = List.generate (
  20, 
  (index) => JokeData(title: "Joke ${index + 1}", description: "This is a funny description for joke ${index + 1}."),
);

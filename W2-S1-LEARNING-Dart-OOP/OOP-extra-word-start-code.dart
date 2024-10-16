// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

// Class House
class House {
  String address;
  List<Tree> trees = [];  // by default empty

  House(this.address);

  void addTree(Tree newTree){
    this.trees.add(newTree);
  }
}
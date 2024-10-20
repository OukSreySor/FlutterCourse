enum Skill { FLUTTER("FLUTTER", 5000 ), DART("DART", 3000), OTHER("OTHER", 1000);
  final double salary;
  final String value;
  const Skill(this.value, this.salary);
  String toString() => value;
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);
  
  String get street => this._street;
  String get city => this._city;
  String get zipCode => this._zipCode;
}
class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  int _yearsOfExperience;
  Address _address;

  Employee(this._name, this._baseSalary, this._skills, this._yearsOfExperience, this._address);

  String get name => this._name;
  double get baseSalary => this._baseSalary;
  List<Skill> get skills => this._skills;
  int get yearsOfExperience => this._yearsOfExperience;
  Address get address => _address;

  Employee.mobileDeveloper(String name, double baseSalary, int yearsOfExperience, Address address)
      : _skills = [Skill.FLUTTER, Skill.DART], 
        this._name = name,
        this._baseSalary = baseSalary,
        this._yearsOfExperience = yearsOfExperience,
        this._address = address;

  double computeSalary() {
    double totalSalary = 0;
    for(var skill in _skills) {
      totalSalary += skill.salary;
    }
    double experienceBonus = _yearsOfExperience * 2000;
    return _baseSalary + totalSalary + experienceBonus;
  } 

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}, Skill: $skills, YearOfExperience: $yearsOfExperience');
    print('Total Salary: \$${computeSalary()}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.DART], 2, Address("6A", "PP", "122526"));
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, [Skill.FLUTTER], 3, Address("7B", "KP", "122526"));
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper('Sara', 50000, 4, Address("8C", "SR", "122526"));
  emp3.printDetails();
}
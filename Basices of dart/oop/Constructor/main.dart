// / Person person = Person("John", 30);
// /Person person = Person();
// /person.name = "John";
// /person.age = 30;

// class ClassName {
//   // Constructor declaration: Same as class name
//   ClassName() {
//     // body of the constructor
//   }
// }
class Student {
  String? name;
  int? age;
  int? rollNumber;

  // Constructor
  Student(String name, int age, int rollNumber) {
    print(
        "Constructor called"); // this is for checking the constructor is called or not.
    this.name = name;
    this.age = age;
    this.rollNumber = rollNumber;
  }
  void display() {
    print("Name: ${this.name}");
    print("Age: ${this.hashCode}");
    print("Roll Number: ${this.rollNumber}");
  }
}

void main() {
  // Here student is object of class Student.
  Student student = Student("John", 20, 1);
  student.display();
}

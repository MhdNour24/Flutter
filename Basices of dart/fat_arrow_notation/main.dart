void main() {
  // * void arrow notation

  void myAge({required  age}) => print("my age is ${age}");
  myAge(age:21);

  // * retutn arrow notation
  String myName(String name) => "my name is ${name}";
  print(myName("John"));
}

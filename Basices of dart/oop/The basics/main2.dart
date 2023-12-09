class Car {
  late String? name;
  late String? color;
  late int? numberOfSeats;

  void start() {
    print("$name car started.");
  }
}

void main(List<String> args) {

  // Here car1 is the first object of class Car. 
  Car car1 = Car();
  car1.name = "BMW";
  car1.color = "red";
  car1.numberOfSeats = 4;
  car1.start();

  // Here car2 is the second object of class Car.
  Car car2 = Car();
  car2.name = "Audi";
  car2.color = "Black";
  car2.numberOfSeats = 4;
  car2.start();
}

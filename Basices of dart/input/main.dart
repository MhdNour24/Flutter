import 'dart:io';

void main() {
  print('Enter your name:');
  String? name = stdin.readLineSync();

  print('Hello, $name!');

  print('Enter your age:');
  int? age = int.tryParse(stdin.readLineSync()!);
  print("your age is $age");
   
}

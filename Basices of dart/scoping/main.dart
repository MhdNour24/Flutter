void main() {
  int x = 10;
  void function() {
    x = 100;
    int y = 235;
  }

  print("the value of the x before running the function is :$x");
  function();
  print("the value of the x after running the function is :$x");

  // ! the variable is a local variable so we can not use it out of the function
  //print(y);


}

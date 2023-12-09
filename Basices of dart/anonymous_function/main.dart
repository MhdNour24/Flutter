void main() {
  // * void anonymous function
  Function myinfo = ({required String firstName}) {
    print("my first name is: ${firstName}");
  };

  // * call anonymous function
  myinfo(firstName: "MHD NOUR");

  // * return anonymous function
  Function sum = (int num1, int num2) => num1 + num2;
  int result = sum(3, 6);
  print(result);

  // chaning the function 
  sum = (int num1, int num2,int num3) => num1 + num2+num3;
  result = sum(3, 6, 9);
  print(result);
  
}

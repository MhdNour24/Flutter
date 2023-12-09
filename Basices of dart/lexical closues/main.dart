void main() {
  Function f1() {
    int x = 10;
    print("f1 before f2 :x=$x");
    int f2() {
      x *= 3;
      print("f2 :x=$x");
      return x;
    }

    print("f2 after f1 :x=$x");
    return f2;
  }

  Function result = f1();
  print(result());
}

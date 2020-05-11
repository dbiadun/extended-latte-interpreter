int main() {
  int x = 0;

  void increase_x() {
    x++;
  }

  void foo() {
    int x = 5;
    increase_x();

    print("Inner x: ");
    print(x);
    print("\n");
  }

  foo();

  print("Outer x: ");
  print(x);
  print("\n");

  return 0;
}

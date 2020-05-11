void increase(int &x) {
  x++;
}

void try_to_change(int x) {
  x = 20;
}

void pretty_print(int x) {
  print("New value of x: ");
  print(x);
  print("\n");
}

int main() {
  int x = 0;
  increase(x);
  increase(x);
  increase(x);
  try_to_change(x);
  
  pretty_print(x);

  return 0;
}

int x = 0;

void increase_x() {
    x++;
}

void decrease_x() {
    x--;
}

int main() {
    print(x);
    print("\n");

    increase_x();
    increase_x();
    increase_x();
    increase_x();

    print(x);
    print("\n");

    decrease_x();
    decrease_x();

    print(x);
    print("\n");

    return 0;
}

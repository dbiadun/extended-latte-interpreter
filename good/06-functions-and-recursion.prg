// 5! = 120

int factorial(int n) {
    if (n > 0)
        return n * factorial(n - 1);
    else
        return 1;
}

int main() {
    print("5! = ");
    print(factorial(5));
    print("\n");

    return 0;
}

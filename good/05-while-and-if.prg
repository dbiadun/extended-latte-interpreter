int main() {
    int i = 0;
    int j = 0;
    while (i < 10) {
        if (i % 2 == 1) {
            print(i);
            print("\n");
        } else {
            j++;
        }
        i++;
    }

    print("\n");
    print(j);
    print("\n");

    return 0;
}

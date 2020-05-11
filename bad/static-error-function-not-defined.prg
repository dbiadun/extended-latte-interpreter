int main() {
    int outer() {
        int inner() {
            return 15;
        }

        return 5;
    }

    print(inner());

    return 0;
}

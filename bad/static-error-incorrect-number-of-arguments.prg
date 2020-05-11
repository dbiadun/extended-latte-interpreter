void add_n(int &container, int n) {
    container = container + n;
}

int main() {
    int x = 0;
    
    add_n(x, 5, 2);
    
    print(x);
    print("\n");

    return 0;
}

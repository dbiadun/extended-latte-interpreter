int sum(int a1, int a2, int a3) {
    return a1 + a2 + a3;
}

bool isEven(int n) {
    return n % 2 == 0;
}

string repeat_n_times(int n, string s) {
    string ret = "";
    while (n > 0) {
        ret = ret + s;
        n--;
    }

    return ret;
}

int main() {
    print(sum(3, 5, 6));
    print("\n");
    
    print(isEven(17));
    print("\n");

    print(repeat_n_times(5, "abc"));
    print("\n");

    return 0;
}

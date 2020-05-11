int main() {
    int x = 0;
    int y = 0;
    
    while (true) {
        x++;
        if (x < 3)
            continue;
        break;
        y++;
    }
    
    print(x);
    print("\n");
    print(y);
    print("\n");
    
    return 0;
}

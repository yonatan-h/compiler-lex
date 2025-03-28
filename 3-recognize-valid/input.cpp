#include <iostream>
#include <string>

int main() {
    int positiveInt = 12;
    int negativeInt = -12;
    double positiveFrac = 1.5;
    double negativeFrac = -1.5;

    
    int arr[] = {1, 2, 3};
    std::string x = "hello world";
    
    std::cout << "hello world" << std::endl;
    
    for (int i = 0; i < 3; i++) {
        std::cout << arr[i] << std::endl;
    }
    
    return 0;
}

void greet() {
    std::cout << "greetings" << std::endl;
}

struct Dog {
    std::string name;
    int houseNumber;
};

int add(int a, int b) {
    if (a + b > 10) {
        return a + b;
    } else {
        return -1;
    }
}
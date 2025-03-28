#include <stdio.h>

int main() {
    int positiveInt = 12;
    int negativeInt = -12;
    double positiveFrac = 1.5;
    double negativeFrac = -1.5;
    printf("hello world");
    
    char x[] = "hello world";
    int arr[] = {1,2,3};
    
    for (int i = 0; i < 3; i++) {
        printf("%d\n", arr[i]);
    }
    
    return 0;
}

void greet() {
    printf("greetings!");
}

struct Person {
    char name[50];
    int age;
};

int add(int a, int b) {
    if (a+b > 10){
        return a + b;
    }else {
        return -1;
    }
}
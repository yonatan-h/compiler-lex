public class HelloWorld {
    private String name;

    public static void main(String[] args) {

            for (int i = 0; i < 10; i++) {
                System.out.println(i);
            }

            int a = 'a';
            int b = 15;
            float c = -5.5;
            double d = 5.6;
            boolean truth = 1 < 2 && 4 > 5 || 8==8;
            System.out.println("hello world\n with new line");
            
    }

    public void greet() {
        System.out.println("greetings!");
    }

    public void sayName() {
        System.out.println("name is " + name);
    }
}

//comment
/* multiline 
 * comment
*/

interface Animal {
    void makeSound();
}

class Dog implements Animal {
    public void makeSound(boolean loud) {
        if (loud){
            System.out.println("WOOF");
        }else{
            System.out.println("woof");
        }
    }
}

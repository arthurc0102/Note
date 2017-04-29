import java.util.Scanner;


public class Hanoi {
    public static int count = 0;
    
    public static void p(String s) {
        System.out.println(s);
    }
    
    public static void runHanoi(int times, char from, char buffer, char to) {
        count++;
        if (times == 1) {
            p(String.format("From %s to %s", from, to));
            return;
        } else {
            runHanoi(times - 1, from, to, buffer);
            p(String.format("From %s to %s", from, to));
            runHanoi(times - 1, buffer, from, to);
        }
    }
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int times = 0;

        while (true) {
            try {
                System.out.print("Please input times: ");
                times = scanner.nextInt();
                if (times > 0){
                    break;
                }
            } catch (Exception e) {
                scanner.next();
                p("Plase intput a number\n");
            }
        }

        char from = 'A';
        char buffer = 'B';
        char to = 'C';

        p("");
        runHanoi(times, from, buffer, to);
        p(String.format("\nTotal time: %d", count));
        scanner.close();
    }
}

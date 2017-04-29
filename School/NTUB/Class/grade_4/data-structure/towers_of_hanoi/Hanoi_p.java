import java.util.Scanner;


public class Hanoi {
    public static int count = 0;
    
    public static void p(String text) {
        System.out.print(text);
    }

    public static void runHanoi(int times, char from, char buffer, char to) {
        count++;
        if (times == 1) {
            p(String.format("From %c move disk to %c\n", from, to));
        } else {
            runHanoi(times - 1, from, to, buffer);
            p(String.format("From %c move disk to %c\n", from, to));
            runHanoi(times - 1, buffer, from, to);
        }
    }

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int times = 0;
        char from = 'A', buffer = 'B', to = 'C';
        String ch;
        
        do {
            while (true) {
                try {
                    p("Input how many disks do you want at A: ");
                    times = s.nextInt();
                    if (times < 0) {
                        p("Please input a number bigger than 0\n");
                        continue;
                    } else {
                        break;
                    }
                } catch (Exception e) {
                    p("Please input a number\n");
                    s.next();
                }
            }
            if (times == 0) {
                p("No disks to move");
            } else {
                runHanoi(times, from, buffer, to);
                p(String.format("Total time: %d\n", count));
                count = 0;            
            }
            p("Do you want to continue? (y/[n])");
            ch = s.next();
        } while(ch.equals("y"));
        s.close();
    }
}

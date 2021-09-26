package q1;

import java.util.Scanner;

public class DemoTurners2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Turner turner;

        outer:while (true) {
            menu();
            int select = input.nextInt();

            switch (select) {
                case 1:
                    turner = new Leaf();
                    break;
                case 2:
                    turner = new Page();
                    break;
                case 3:
                    turner = new Pancake();
                    break;
                case 4:
                    turner = new Tv();
                    break;
                case 5:
                    turner = new House();
                    break;
                case 6:
                    break outer;
                default:
                    turner = null;
            }
            if (turner != null)
                turner.turn();
            else
                System.out.println("Choose write option number.");
        }

    }

    private static void menu() {
        System.out.println("-------------------");
        System.out.println("1. Change colors");
        System.out.println("2. Go to the next page");
        System.out.println("3. Flip");
        System.out.println("4. Change TV channels");
        System.out.println("5. Turn on lights");
        System.out.println("6. Exit");
        System.out.println("Choose your option: ");
    }
}

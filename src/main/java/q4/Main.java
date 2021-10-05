package q4;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Dao dao = new Dao();

        boolean isRunning = true;

        while (isRunning) {
            System.out.println("--------------------------");
            System.out.println("Select your option:");
            System.out.println("1. Max Value For Coach");
            System.out.println("2. Max Value For Player");
            System.out.println("3. Teams Count In Each City");
            System.out.println("4. Teams All Points");
            System.out.println("5. Champion Team");
            System.out.println("6. Derby Match With More Goals Teams Name");
            System.out.println("7. Exit");
            int option = scanner.nextInt();

            switch (option) {
                case 1:
                    dao.maxValueForCoach();
                    break;
                case 2:
                    dao.maxValueForPlayer();
                    break;
                case 3:
                    dao.teamsCountInEachCity();
                    break;
                case 4:
                    dao.teamsPoints();
                    break;
                case 5:
                    dao.championTeam();
                    break;
                case 6:
                    dao.derbyMatchTeamsWithMoreGoals();
                    break;
                case 7:
                    isRunning = false;
                    break;
                default:
                    System.out.println("Enter a number between 1-7!!!");
            }
        }
    }
}

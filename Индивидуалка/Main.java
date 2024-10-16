import javax.swing.*;
import java.awt.*;

public class Main {
    public static void main(String[] args) {
        task2();
    }

    private static void task1(){
        Angle a1 = new Angle(713);
        Angle a2 = new Angle(120, true);
        System.out.println(a1.getAngle() + " " +a2.getAngle());

        Angle a3 = new Angle(334);
        switch (a1.compare(a3)){
            case -1: System.out.println("a1 меньше a3"); break;
            case 0: System.out.println("a1 равен a3"); break;
            case 1: System.out.println("a1 больше a3"); break;
        }

        a1.increaseAngle(a3);
        System.out.println(a1.getAngle());
    }

    private static void task2(){
        MobilePhone p1 = new Smartphone("I",
                5,
                30,
                "Android",
                "Octa-core",
                5
        );

        p1.addContact(new MobContact("Скорая помощь", "103"));
        p1.call("Скорая помощь", "103");
        p1.changeContact("Скорая помощь",
                "103",
                "Экстренные оперативные службы",
                "112");
        p1.deleteContact("Экстренные оперативные службы", "112");
        System.out.println(p1.info());
    }




    private void draw(){
        JFrame frame = new JFrame("s");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        Dimension size = new Dimension(800, 600 );
        frame.setSize(size);
        frame.setMinimumSize(size);
        frame.setUndecorated(false);
        frame.add(new Panel());
        frame.setVisible(true);
    }
}


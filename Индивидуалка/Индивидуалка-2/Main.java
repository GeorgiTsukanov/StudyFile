public class Main {
    public static void main(String[] args) {
        task_1();
    }

    public static void task_1(){
        Bubble s = new Bubble(new double[]{1, 2, 3, 5, 2});
        s.sort();
        s.print();
        s.foreach();
        s.print();
    }

    public static void task_2(){
        Choice s = new Choice(new double[]{1, 2, 3, 5, 2});
        s.sort();
        s.print();
        s.foreach();
        s.print();
    }












    /*
    private TestAbstract sss(){
        TestAbstract a = new TestChildAb();
        return a;
    }

    private static void test_throw(){
        int x = 5;
        try {
            if (x == 5) {
                throw new TestException("aaa", x);
            }
        }
        catch (TestException ex){
            System.out.println(ex.getNumber() + " " + ex.getMessage());
        }
    }



    private static void task1() {
        Angle a = new Angle(32.993);
        a.degre_minute();

        Angle a1 = new Angle(713);
        Angle a2 = new Angle(33);
        Angle a1_a2 = a1.increaseAngle(a2);
        System.out.println(a1_a2.getAngle());

        Angle b1 = new Angle(713);
        Angle b1_30 = b1.increaseAngle(30);
        System.out.println(b1_30.getAngle());

        Angle a3 = new Angle(334);
        switch (a1.compare(a3)) {
            case -1:
                System.out.println("a1 меньше a3");
                break;
            case 0:
                System.out.println("a1 равен a3");
                break;
            case 1:
                System.out.println("a1 больше a3");
                break;
        }
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

        Smartphone p2 = new Smartphone("I",
                5,
                30,
                "Android",
                "Octa-core",
                5
        );

        p2.takePicture();
    }
     */
}


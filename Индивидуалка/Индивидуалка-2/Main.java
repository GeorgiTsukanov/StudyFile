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
}


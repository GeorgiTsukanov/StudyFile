package Ex2;

import javax.swing.*;

public class Main {
    public static void main(String[] args) {

        double[] x = {-5, 1, 2, 3, 4};
        double[] y = {0, 3, 4, 9, 0};

        Spline spline = new Spline(x, y);
        SplineSerializer.saveSpline(spline, "Data/Spline.bin");
        Spline s = SplineSerializer.getSpline(0, "Data/Spline.bin");

        JFrame frame = new JFrame("Кубический сплайн с шагом 0.1");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.add(new SplineInterpolationPlot(s));
        frame.setVisible(true);
    }
}

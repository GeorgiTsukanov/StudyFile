package Ex2;

import java.io.Serializable;

public class Spline implements Serializable {
    private double[] x;
    private double[] y;
    private double[] a, b, c, d;

    public Spline(double[] x, double[] y) {
        if (x.length != y.length || x.length < 2) {
            throw new IllegalArgumentException("Введены некорректные данные");
        }

        this.x = x.clone();
        this.y = y.clone();
        int n = x.length;

        a = new double[n];
        b = new double[n];
        c = new double[n];
        d = new double[n];

        calculateCoefficients();
    }

    private void calculateCoefficients() {
        int n = x.length;
        double[] h = new double[n - 1];

        // Вычисление h[i] = x[i+1] - x[i]
        for (int i = 0; i < n - 1; i++) {
            h[i] = x[i + 1] - x[i];
            if (h[i] <= 0) {
                throw new IllegalArgumentException("Узлы x должны быть упорядочены по возрастанию");
            }
        }

        double[] alpha = new double[n - 1];
        // Вычисление alpha[i] = 3/h[i]*(y[i+1]-y[i]) - 3/h[i-1]*(y[i]-y[i-1])
        for (int i = 1; i < n - 1; i++) {
            alpha[i] = 3 * ((y[i + 1] - y[i]) / h[i] - (y[i] - y[i - 1]) / h[i - 1]);
        }

        // Решение трехдиагональной системы методом прогонки
        double[] l = new double[n];
        double[] mu = new double[n];
        double[] z = new double[n];

        l[0] = 1;
        mu[0] = 0;
        z[0] = 0;

        for (int i = 1; i < n - 1; i++) {
            l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * mu[i - 1];
            mu[i] = h[i] / l[i];
            z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
        }

        l[n - 1] = 1;
        z[n - 1] = 0;
        c[n - 1] = 0;

        // Обратный ход метода прогонки
        for (int i = n - 2; i >= 0; i--) {
            c[i] = z[i] - mu[i] * c[i + 1];
            b[i] = (y[i + 1] - y[i]) / h[i] - h[i] * (c[i + 1] + 2 * c[i]) / 3;
            d[i] = (c[i + 1] - c[i]) / (3 * h[i]);
        }

        a = y.clone();
    }

    public double interpolate(double xValue) {
        if (xValue < x[0] || xValue > x[x.length - 1]) {
            throw new IllegalArgumentException("x выходит за границы интерполяции");
        }
        
        int i = 0;
        while (i < x.length - 1 && xValue > x[i + 1]) {
            i++;
        }

        if (i == x.length - 1) {
            i--;
        }

        double dx = xValue - x[i];
        return a[i] + b[i] * dx + c[i] * dx * dx + d[i] * dx * dx * dx;
    }

    public double[] getX() {
        return x;
    }

    public double[] getY() {
        return y;
    }
}
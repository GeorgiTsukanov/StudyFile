package Ex2;

import javax.swing.*;
import java.awt.*;
import java.awt.geom.*;
import java.util.ArrayList;
import java.util.List;

public class SplineInterpolationPlot extends JPanel {
    private static final int PADDING = 50;
    private static final double STEP = 0.1;
    private final Spline spline;
    private final double[] xPoints, yPoints;
    private double minX, maxX, minY, maxY;

    public SplineInterpolationPlot(Spline s) {
        this.spline = s;
        this.xPoints = s.getX();
        this.yPoints = s.getY();

        minX = xPoints[0];
        maxX = xPoints[xPoints.length - 1];
        minY = yPoints[0];
        maxY = yPoints[0];
        for (double yi : yPoints) {
            if (yi < minY) minY = yi;
            if (yi > maxY) maxY = yi;
        }

        minY -= 1;
        maxY += 1;
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        int width = getWidth();
        int height = getHeight();


        // Ось X
        g2d.setColor(Color.BLACK);
        g2d.drawLine(PADDING, height - PADDING, width - PADDING, height - PADDING); // X
        g2d.drawLine(PADDING, height - PADDING, PADDING, PADDING); // Y


        g2d.drawString("X", width - PADDING + 5, height - PADDING);
        g2d.drawString("Y", PADDING, PADDING - 5);

        double xScale = (width - 2 * PADDING) / (maxX - minX);
        double yScale = (height - 2 * PADDING) / (maxY - minY);

        g2d.setColor(Color.GRAY);
        for (double x = minX; x <= maxX; x += 1.0) {
            int px = PADDING + (int) ((x - minX) * xScale);
            g2d.drawLine(px, height - PADDING, px, height - PADDING + 5);
            g2d.drawString(String.format("%.1f", x), px - 10, height - PADDING + 20);
        }

        for (double y = Math.ceil(minY); y <= Math.floor(maxY); y += 1.0) {
            int py = height - PADDING - (int) ((y - minY) * yScale);
            g2d.drawLine(PADDING - 5, py, PADDING, py);
            g2d.drawString(String.format("%.1f", y), PADDING - 40, py + 5);
        }

        g2d.setColor(Color.BLUE);
        for (double x = minX; x <= maxX; x += STEP) {
            double y = spline.interpolate(x);
            int px = PADDING + (int) ((x - minX) * xScale);
            int py = height - PADDING - (int) ((y - minY) * yScale);
            g2d.fillOval(px - 1, py - 1, 3, 3);
        }

        g2d.setColor(Color.RED);
        for (int i = 0; i < xPoints.length; i++) {
            int px = PADDING + (int) ((xPoints[i] - minX) * xScale);
            int py = height - PADDING - (int) ((yPoints[i] - minY) * yScale);
            g2d.fillOval(px - 3, py - 3, 6, 6);
        }
    }
}
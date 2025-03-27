package Ex2;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class SplineSerializer {
    public static void saveSpline(Spline sp, String path) {
        List<Spline> splines = new ArrayList<>();

        File file = new File(path);
        if (file.exists()) {
            splines = readAllSplines(path);
        }

        splines.add(sp);
        try (ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(path))) {
            out.writeObject(splines);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    public static Spline getSpline(int index, String path) {
        List<Spline> splines = readAllSplines(path);
        if (index >= 0 && index < splines.size()) {
            return splines.get(index);
        } else {
            throw new IndexOutOfBoundsException("Индекс выходит за границы.");
        }
    }

    @SuppressWarnings("unchecked")
    private static List<Spline> readAllSplines(String path) {
        File file = new File(path);
        if (!file.exists()) {
            return new ArrayList<>();
        }
        try (ObjectInputStream in = new ObjectInputStream(new FileInputStream(path))) {
            return (List<Spline>) in.readObject();
        } catch (IOException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
            return new ArrayList<>();
        }
    }
}

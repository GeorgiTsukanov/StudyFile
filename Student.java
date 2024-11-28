import java.util.Comparator;
import java.util.Random;

public class Student {
    private String fio;
    private String faculty;
    private int kurs;
    private int subgroup;
    private int[] mark;

    public Student(String fio,
                   String faculty,
                   int kurs,
                   int kolvo){
        this.fio = fio;
        this.faculty = faculty;
        this.kurs = kurs;
        this.subgroup = 0;
        this.mark = new int[kolvo];

        for (int i = 0; i < mark.length; i++){
            mark[i] = new Random().nextInt(4)+2;
        }
    }

    public Student(String fio,
                   String faculty,
                   int kurs,
                   int[] mark){
        this.fio = fio;
        this.faculty = faculty;
        this.kurs = kurs;
        this.mark = mark;
    }

    public float midleArith(){
        float sum = 0;
        for (int i = 0; i < mark.length; i++){
            sum += mark[i];
        }
        return sum/mark.length;
    }




    //GET and SET
    public int getKurs() {
        return kurs;
    }

    public int getSubgroup() {
        return subgroup;
    }

    public String getFio() {
        return fio;
    }

    public String getFaculty() {
        return faculty;
    }

    public int[] getMark() {
        return mark;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public void setKurs(int kurs) {
        this.kurs = kurs;
    }

    public void setMark(int[] mark) {
        this.mark = mark;
    }

    public void setSubgroup(int subgroup) {
        this.subgroup = subgroup;
    }
}

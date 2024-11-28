import java.util.ArrayList;
import java.util.Comparator;

public class StudentGroup{
    private int num_group;
    private int kolvo_subgroup;
    private ArrayList<Student> group;

    public StudentGroup(int num_group, int kolvo_subgroup){
        this.num_group = num_group;
        this.kolvo_subgroup = kolvo_subgroup;
        group = new ArrayList<Student>();
    }

    public void addStudent(Student s, int subgroup){
        s.setSubgroup(subgroup);
        group.add(s);
        System.out.println("Студент " + s.getFio() + " добавлен в группу");
    }

    public void deleteStudent(String fio){
        int pos = -1;
        for (int i=0; i < group.size(); i++){
            if (fio.equalsIgnoreCase(group.get(i).getFio())){
                pos = i;
                break;
            }
        }
        if (pos != -1){
            System.out.println("Студент " + group.get(pos).getFio() + " убран из группы");
            group.remove(pos);
        }
        else {
            System.out.println("Студента с таким ФИО отсутствует в группе");
        }
    }

    public void print(){
        System.out.println("Список группы:");
        for (int i=0; i<group.size(); i++){
            System.out.println(i+1 + ") " + group.get(i).getFio());
        }
    }

    public void delMenSrBal(double srBal) {
        for (int i = 0; i < group.size(); i++) {
            if (group.get(i).midleArith() < srBal) {
                deleteStudent(group.get(i).getFio());
            }
        }
    }

    public void printSubgroup(int sub){
        System.out.println("Список подгруппы " + sub + ":");
        for (int i = 0; i<group.size(); i++){
            if (group.get(i).getSubgroup() == sub){
                System.out.println(i+1 + ") " + group.get(i).getFio());
            }
        }
    }

    public static Comparator<Student> Fio = new Comparator<Student>() {
        @Override
        public int compare(Student s1, Student s2) {
            return s1.getFio().compareToIgnoreCase(s2.getFio());
        }
    };

    public static Comparator<Student> SrMark = new Comparator<Student>() {
        @Override
        public int compare(Student s1, Student s2) {
            if (s1.midleArith() > s2.midleArith()){
                return 1;
            }
            else{
                return 0;
            }
        }
    };

    public void sortF(){
        group.sort(Fio);
    }

    public void sortSrMark(){
        group.sort(SrMark);
    }
}

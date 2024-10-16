import java.util.Vector;

public class MobilePhone {
    private String manufacturer;
    private int com_standard;
    private double battery_life;
    private Vector<MobContact> contacts;

    public MobilePhone(String manufacturer, int com_standard, double battery_life){
        this.manufacturer = manufacturer;
        this.com_standard = com_standard;
        this.battery_life = battery_life;
        contacts = new Vector<MobContact>();
    }

    public String info(){
        return ("Производитель: " + manufacturer + "\n" +
                "Стандарт связи: " + com_standard + "g\n" +
                "Время работы батареи в часах: " + battery_life + "\n"
        );
    }

    private int searhContact(String name, String number){
        for (int i=0; i < contacts.size(); i++){
            if (
                    (contacts.elementAt(i).getName().equals(name)) &&
                    (contacts.elementAt(i).getNumber().equals(number))
            ) {
                return i;
            }
        }
        return -1;
    }

    public void addContact(String name, String number){
        MobContact c = new MobContact(name, number);
        contacts.add(c);
        System.out.println("Добавлен новый контакт:\n" +
                    "Имя: " + c.getName() + "\n" +
                    "Номер: " + c.getNumber() + "\n"
        );
    }

    public void addContact(MobContact c){
        contacts.add(c);
        System.out.println("Добавлен новый контакт:\n" +
                "Имя: " + c.getName() + "\n" +
                "Номер: " + c.getNumber() + "\n"
        );
    }

    public void changeContact(String name, String number, String new_name, String new_number){
        int n = searhContact(name, number);
        if (n != -1) {
            contacts.elementAt(n).setName(new_name);
            contacts.elementAt(n).setNumber(new_number);
            System.out.println("Данные контакты изменены:\n" +
                    "Имя:" + name + " -> " + new_name + "\n" +
                    "Номер: " + number + " -> " + new_number
            );
        }
        else{
            System.out.println("Данный контакт не найден");
        }
    }

    public void deleteContact(String name, String number){
        int n = searhContact(name, number);
        if (n != -1){
            contacts.remove(n);
            System.out.println("Контакт удалён");
        }
        else{
            System.out.println("Данный контакт не найден");
        }

    }

    public void call(String name, String number){
        int n = searhContact(name, number);
        if (n != -1) {
            System.out.println("Набираем абоненту:" + contacts.elementAt(n).getName() + "\n...");
        }
        else{
            System.out.println("Данный контакт не найден");
        }
    }

    //GET
    public double getBattery_life() {
        return battery_life;
    }

    public int getCom_standard() {
        return com_standard;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    //SET
    public void setBattery_life(double battery_life) {
        this.battery_life = battery_life;
    }

    public void setCom_standard(int com_standard) {
        this.com_standard = com_standard;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
}

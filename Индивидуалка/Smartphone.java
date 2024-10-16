import java.util.Vector;

public class Smartphone extends MobilePhone{
    private String os;
    private String processor;
    private int mp_camera;
    private Vector<String> application;

    public Smartphone(String manufacturer,
                      int com_standard,
                      double battery_life,
                      String os,
                      String processor,
                      int mp_camera)
    {
        super(manufacturer, com_standard, battery_life);
        this.os = os;
        this.processor = processor;
        this.mp_camera = mp_camera;
        application = new Vector<String>();
    }

    @Override
    public String info(){
        return ("Производитель: " + super.getManufacturer() + "\n" +
                "Стандарт связи: " + super.getCom_standard() + "g\n" +
                "Время работы батареи в часах: " + super.getBattery_life() + "\n" +
                "Оперативная система: " + os + "\n" +
                "Процессор: " + processor + "\n" +
                "Разрешение камеры в мп : " + mp_camera + "\n"
        );
    }

    /*либо
    public String info(){
        return (super.info() +
                "Оперативная система: " + os + "\n" +
                "Процессор: " + processor + "\n" +
                "Камера в мп: " + mp_camera + "\n"
        );
    }
     */

    private int searhApplication(String name){
        for (int i=0; i < application.size(); i++){
            if (application.elementAt(i).equals(name)) {
                return i;
            }
        }
        return -1;
    }

    public void installApplication(String name){
        application.add(name);
        System.out.println(name+ " установлено");
    }

    public void uninstallApplication(String name){
        if (searhApplication(name) != -1){
            application.remove(searhApplication(name));
        }
    }

    public void launchApplication(String name){
        if (searhApplication(name) != -1){
            System.out.println(name + " запускается");
        }
    }


    public void takePicture(){
        System.out.println("Улыбочку\nЧик!");
    }

    //GET
    public String getOs() {
        return os;
    }

    public String getProcessor() {
        return processor;
    }

    public int getMp_camera() {
        return mp_camera;
    }

    //SET
    public void setOs(String os) {
        this.os = os;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public void setMp_camera(int mp_camera) {
        this.mp_camera = mp_camera;
    }
}

public class Angle {
    private double angle;
    private int degre;
    private int minute;

    public Angle(double angle){
        this.angle = toNorm(angle);
        this.degre = to_degre(toNorm(angle));
        this.minute = to_minute(toNorm(angle));
    }

    public Angle(int degre, int minute){
        this.angle = toNorm(degre + minute/60.0);
        this.degre = degre;
        this.minute = minute;
    }

    public void degre_minute(){
        System.out.println(degre + "°" + minute + '\'');
    }

    int to_degre(double angle){
        String a = Double.toString(angle);
        int degre = Integer.parseInt(a.substring(0, a.indexOf(".")));
        return degre;
    }

    int to_minute(double angle){
        String a = Double.toString(angle);
        int tochka = a.indexOf(".") + 1;
        String b = a.substring(tochka);
        float minute = Float.parseFloat(b);
        minute /= 60.0f;
        return Math.round(minute);
    }

    public double toNorm(double angle){
        angle %= 360;
        if (angle < 0){
            angle += 360;
        }
        return angle;
    }

    public double toRadian(){
        return (angle * (Math.PI/180.0));
    }

    public int compare(Angle angle_2){
        if (angle < angle_2.getAngle()){
            return -1;
        }
        else if (angle == angle_2.getAngle()) {
            return 0;
        }
        else {
            return 1;
        }
    }




    public Angle decreaseAngle(double angle){
        Angle angle_new = new Angle(this.angle - toNorm(angle));
        return angle_new;
    }

    public Angle decreaseAngle(Angle a2){
        Angle angle_new = new Angle(angle - a2.getAngle());
        return angle_new;
    }

    public Angle increaseAngle(double angle){
        Angle angle_new = new Angle(this.angle + toNorm(angle));
        return angle_new;
    }

    public Angle increaseAngle(Angle a2){
        Angle angle_new = new Angle(angle + a2.getAngle());
        return angle_new;
    }

    //GET
    public double getAngle() {
        return angle;
    }

    public int getDegre() {
        return degre;
    }

    public int getMinute() {
        return minute;
    }

    //SET
    public void setAngle(double angle) {
        this.angle = toNorm(angle);
    }

    public void setDegre(int degre) {
        this.degre = degre;
    }

    public void setMinute(int minute) {
        this.minute = minute;
    }
}

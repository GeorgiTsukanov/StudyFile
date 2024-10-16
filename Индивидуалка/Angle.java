public class Angle {
    private double angle;

    public Angle(double angle){
        this.angle = toNorm(angle);
    }

    public Angle(int minute, boolean it_is_minute){
        this.angle = toNorm(1/60.0 * minute);
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

    public void decreaseAngle(double angle){
        this.angle = toNorm(angle - toNorm(angle));
    }

    public void decreaseAngle(int minute, boolean it_is_minute){
        this.angle = toNorm(angle- toNorm(1/60.0 * minute));
    }

    public void decreaseAngle(Angle a2){
        this.angle = toNorm(angle - a2.getAngle());
    }

    public void increaseAngle(double angle){
        this.angle = toNorm(angle + toNorm(angle));
    }

    public void increaseAngle(int minute, boolean it_is_minute){
        this.angle = toNorm(angle + toNorm(1/60.0 * minute));
    }

    public void increaseAngle(Angle a2){
        this.angle = toNorm(angle + a2.getAngle());
    }

    //GET
    public double getAngle() {
        return angle;
    }

    //SET
    public void setAngle(double angle) {
        this.angle = toNorm(angle);
    }

    public void setAngle(int minute, boolean it_is_minute){
        this.angle = toNorm(1/60.0 * minute);
    }
}

import java.util.Arrays;

public class Bubble implements Container{
    private double[] container;

    public Bubble(double[] container){
        this.container = container;
    }

    public void sort() {
        for (int out = container.length - 1; out >= 1; out--) {
            for (int in = 0; in < out; in++) {
                if (container[in] > container[in + 1]) {
                    double cur = container[in];
                    container[in] = container[in + 1];
                    container[in + 1] = cur;
                }
            }
        }
    }

    public void foreach(){
        for (int i=0; i<container.length; i++){
            container[i] = Math.sqrt(container[i]);
        }
    }

    public void print() {
        for (int i=0; i<container.length; i++){
            System.out.print(container[i] + " ");
        }
        System.out.println();
    }
}

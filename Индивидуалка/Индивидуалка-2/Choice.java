public class Choice implements Container{
    private double[] container;

    public Choice(double[] container){
        this.container = container;
    }

    public void sort(){
        for (int left = 0; left < container.length; left++) {
            int minInd = left;
            for (int i = left; i < container.length; i++) {
                if (container[i] < container[minInd]) {
                    minInd = i;
                    double cur = container[minInd];
                    container[minInd] = container[left];
                    container[left] = cur;
                }
            }
        }
    }

    public void foreach() {
        for (int i=0; i<container.length; i++){
            container[i] = Math.log(container[i]);
        }
    }

    public void print() {
        for (int i=0; i<container.length; i++){
            System.out.print(container[i] + " ");
        }
        System.out.println();
    }
}

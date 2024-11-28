package C28_11;

public class List<T> {
    private ListItem<T> first;
    private ListItem<T> last;
    private int size;

    public List(T data){
        first = last = new ListItem<T>(data);
        size = 1;
    }

    public List(){
        first = last = null;
        size = 0;
    }

    public void add(T data){
        ListItem<T> t = new ListItem<T>(data);
        if (size > 0){
            last.setNext(t);
            t.setPrev(last);
        }
        else {
            first = t;
        }
        size++;
        last = t;
    }

    public void print(){
        ListItem<T> t = first;
        while (t != null){
            System.out.println(t.getData().toString());
            t = t.getNext();
        }
    }

    public boolean isSym(){
        ListItem<T> t1 = first;
        ListItem<T> t2 = last;
        while (t1 != null && t2  != null){
            if (!t1.getData().equals(t2.getData())){
                return false;
            }
            t1 = t1.getNext();
            t2 = t2.getPrev();
        }
        return true;
    }

}

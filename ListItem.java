package C28_11;

public class ListItem<T> {
     private T data;
     private ListItem<T> next;
     private ListItem<T> prev;


     ListItem(T data){
         this.data = data;
         next = prev = null;
     }

     public ListItem<T> getNext() {
         return next;
    }

    public ListItem<T> getPrev() {
        return prev;
    }

    public T getData() {
        return data;
    }

    public void setNext(ListItem<T> next) {
        this.next = next;
    }

    public void setPrev(ListItem<T> prev) {
        this.prev = prev;
    }

    public void setData(T data) {
        this.data = data;
    }
}

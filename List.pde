public class TList<T> {  //必要最低限のリスト
  private Node head;//先頭
  private Node tale;//最後尾（追加するノード）
  private Node now;//現在リストが参照しているノード
  private int size;//リストサイズ

  private class Node {
    Node next, prev;
    T obj;
    Node(T obj) {
      this.obj = obj;
      next = prev = null;
    }
  }

  public int size() { 
    return size;
  }

  //要素の追加
  public void add(T t) {
    Node n = new Node(t);
    size++;
    if (head == null) {
      now = head = tale = new Node(t);
    } else {
      tale.next = n;
      n.prev = tale;
      tale = n;
    }
  }

  //先頭から取り出し
  public void remove() {
    if (head == null || size == 0) return;
    head = head.next;
    if (head != null)head.prev = null;
    size--;
  }
  
  //nowをリストから削除
  public void removeNow() {
    if (head == null || now == null) return;
    if (now == head) {
      head = now.next;
    }
    if (now == tale) {
      tale = now.prev;
    }
    if (now.prev != null) {
      now.prev.next = now.next;
    }
    if (now.next != null) now.next.prev = now.prev;
    now = now.next;
    size--;
  }

  //nowを先頭に参照
  public T head2Now() {
    if (head == null) return null;
    return (now = head).obj;
  }

  //連続して呼ぶと次のノードを取得できる
  public T getNext() {
    if (now == null || now.next == null) return null;
    return (now = now.next).obj;//nowに次のノードを代入しそののノードのobjを返してる
  }
}

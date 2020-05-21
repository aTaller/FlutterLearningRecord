class QiCounter {
  int countValue = 0;
  int increment() {
    return ++countValue;
  }

  int decrease() {
    return --countValue;
  }
}

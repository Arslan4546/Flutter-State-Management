// this is the number class that generates a stream of numbers from 1 to 500
class Number {
  Stream<int> getNumbers(int max) async* {
    for (int i = 1; i <= max; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}

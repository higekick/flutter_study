// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:uandme/api_client.dart';

void main() {
  // test('Counter value should be incremented', () {
  //   final counter = Counter();
  //
  //   counter.increment();
  //
  //   expect(counter.value, 1);
  // });

  test('api covert test', () async {
    String from = 'US Dollar';
    String to = 'Gold Bar';
    double amount = 500.0;
    final result = await ApiClient().convert(from, to, amount);
    print("result=" + result.toString());
  });

}
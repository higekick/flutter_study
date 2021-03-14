import 'package:flutter_test/flutter_test.dart';

void main() async {
  ready();
  await countDown();
  go();
}

void ready() {
  print("Ready set...");
}

Future<void> countDown() {
  return Future<void>((){
    countNumber(3);
    countNumber(2);
    countNumber(1);
  });
}

void countNumber(number) {
  Future.delayed(Duration(seconds: 1),() {
    print(number);
  });
}

void go() {
  print("Go!!");
}
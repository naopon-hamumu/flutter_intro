import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('.parse() fails on invalid input', () {
//     expect(() => int.parse('x'), throwsFormatException);
//   });
// }

void main() {
  setUpAll(() {print("テスト全体の事前処理");});
  setUp(() {print("メソッドごとの事前処理");});
  tearDown(() {print("メソッドごとの事後処理");});
  tearDownAll(() {print("テスト全体の事後処理");});
  // 以後テストケースを記述
  test("mytest1", () {print("mytest1");});
  test("mytest2", () {print("mytest2");});
}

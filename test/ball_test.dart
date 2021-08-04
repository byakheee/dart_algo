import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

int solve(int redNum, int blueNum, int redP, int blueP, int bothP) {
  // redP + blueP と bothP のどちらが多いか
  if (redP + blueP > bothP * 2) {
    return redP * redNum + blueP * blueNum;
  }
  return bothP * 2 * min(redNum, blueNum).toInt() +
      max(redP, blueP).toInt() * (redNum - blueNum).abs();
}

void main() {
  test('pt.1', () => expect(solve(2, 3, 100, 400, 200), 1400));
  test('pt.2', () => expect(solve(2, 3, 100, 400, 300), 1600));
  test('pt.3', () => expect(solve(5, 5, 464, 464, 464), 4640));
  test('pt.4', () => expect(solve(1, 4, 20, -30, -10), -100));
  test('pt.5', () => expect(solve(9, 1, -1, -10, 4), 0));
}

import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

/// A個の表のコインとB個の裏のコインがあるとき、任意のK個のコインを選んで裏表を変えることができます
/// 全てのコインを裏にするには、何回裏表を変える必要がありますか。
/// 最小の数を返してください

int solve(int A, int B, int K) {
  if (A % K == 0) return (A / K).floor();
  if (A + B < K) return -1;

  // K = 3 のとき
  // (3, 0) > A +3
  // (2, 1) > A +1
  // (1, 2) > A -1
  // (0, 3) > A -3

  // K = 5のとき
  // (5, 0)

  return 0;
}

void main() {
  test('pt.1', () => expect(solve(3, 0, 3), 1));
  test('pt.2', () => expect(solve(4, 0, 3), 4));
  test('pt.3', () => expect(solve(4, 1, 3), 2));
  test('pt.4', () => expect(solve(3, 2, 5), -1));
  test('pt.5', () => expect(solve(100000, 100000, 578), 174));
  test('pt.6', () => expect(solve(0, 0, 1), 0));
  test('pt.7', () => expect(solve(4, 44, 50), -1));
}

//  * 数学
//  * 最小何個の円をまたいで目的地にたどり着くか問題
//  *
//  * circles country = 円で区切られた区域がある国
//  * 区域の協会は交差せず、接してもいない
//  * 区域は含まれることがある
//  *
//  * 区域 i の中心は (x[i], y[i]), 半径 R[i]
//  * 現在地は (x1, y1), (x2, y2) に向かう
//  * ※境界線上にはない
//  *
//  * 最小の境界数を返す
//  *
//  * x: 1 <= length <= 50
//  * x, y, R: 同じ要素数を持つ配列
//  * x, y: -1000 <= value <= 1000
//  * R: 1 <= length <= 1000

import 'dart:math';

import 'package:quiver/iterables.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';

int solve(List<int> listX, List<int> listY, List<int> listR, int startX,
    int startY, int goalX, int goalY) {
  return zip([listX, listY, listR])
      .where((circle) =>
          (sqrt(pow(circle[0] - startX, 2) + pow(circle[1] - startY, 2)) <=
              circle[2]) !=
          (sqrt(pow(circle[0] - goalX, 2) + pow(circle[1] - goalY, 2)) <=
              circle[2]))
      .length;
}

void main() {
  test('Pt.1', () => expect(solve([0], [0], [2], -5, 1, 5, 1), 0));
  test('Pt.2',
      () => expect(solve([0, -6, 6], [0, 1, 2], [2, 2, 2], -5, 1, 5, 1), 2));
  test(
      'Pt.3',
      () => expect(
          solve([1, -3, 2, 5, -4, 12, 12], [1, -1, 2, 5, 5, 1, 1],
              [8, 1, 2, 1, 1, 1, 2], -5, 1, 12, 1),
          3));
  test(
      'Pt.4',
      () => expect(
          solve([-3, 2, 2, 0, -4, 12, 12, 12], [-1, 2, 3, 1, 5, 1, 1, 1],
              [1, 3, 1, 7, 1, 1, 2, 3], 2, 3, 13, 2),
          5));
}

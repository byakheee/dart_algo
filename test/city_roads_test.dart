import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

/// N 個の都市がある
/// 各都市同士は双方向の道路で繋がれている
///
/// 次のルールを満たす移動の数を、1,000,000,007 で割り、余りを返して下さい
///
/// - 1つの都市から始めて、N-1個の道路を通って別の都市で移動を終える
/// - 各都市を1回だけ訪れる
/// - string roads[] で i番目のの要素の j番目が 'Y' なら i -> j(or j -> i) の道路を通る
///
/// string roads[] : 2 <= length <= 50
/// roads[i]: 2 <= length <= 50
/// roads[i][j]: 'Y' or 'N'
/// roads[i][i]: 'N'
/// roads[i][j]: roads[j][i]
///
/// 注意: roads が示すのは「通ることが必須かどうか」、全部の街には通路がある

void genRoute(String current, List<String> candidate, List<String> route) {
  if (candidate.isEmpty) return route.add(current);
  for (var i = 0; i < candidate.length; i++) {
    var nextCandidate = [...candidate];
    genRoute(current + nextCandidate.removeAt(i), nextCandidate, route);
  }
}

int solve(List<String> roads) {
  // 取りうるすべてのルートを出力する
  var routes = <String>[];
  genRoute(
      '', List<String>.generate(roads.length, (i) => (i).toString()), routes);
  // 通るべきすべてのルートを出力する
  var requiredRoutes = <String>[];
  for (var i = 0; i < roads.length; i++) {
    for (var j = i; j < roads[i].length; j++) {
      if (roads[i][j] == 'Y') {
        requiredRoutes.add(i.toString() + j.toString());
      }
    }
  }
  // ルートの中から通るべきルートをすべて通っているものをカウントする
  return routes
      .where((route) => requiredRoutes.every((requiredRoute) =>
          route.contains(requiredRoute) ||
          route.contains(requiredRoute.split('').reversed.join())))
      .length;
}

void main() {
  test('Pt.1', () => expect(solve(['NYN', 'YNN', 'NNN']), 4));
  test('Pt.2', () => expect(solve(['NYYY', 'YNNN', 'YNNN', 'YNNN']), 0));
  test('Pt.3', () => expect(solve(['NYY', 'YNY', 'YYN']), 0));
  test(
      'Pt.4',
      () => expect(
          solve(['NNNNNY', 'NNNNYN', 'NNNNYN', 'NNNNNN', 'NYYNNN', 'YNNNNN']),
          24));
}

import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

/// N個の足場があって，i(＝0,1,...,N－1)番目の足場の高さはhiで与えられます.
/// 最初０番目の足場にカエルがいて，以下のいずれかの行動を繰り返してN－1番目の足場を目指します．
/// 足場iから足場i＋1へと移動する(コストは|hi－hi＋1|)
/// 足場iから足場i＋2へと移動する(コストは|hi－hi＋2|)
/// カエルがN－1番目の足場にたどり着くまでに要するコストの総和の最小値を求めてください．

int solve(List<int> listH) {
  // 各足場へ移動する最小コストを計算する
  var minConsts = [0, (listH[0] - listH[1]).abs()];
  for (var i = 2; i < listH.length; i++) {
    minConsts.add(min(
        // 次の足場へ行く場合
        minConsts[i - 1] + (listH[i - 1] - listH[i]).abs(),
        // 一つ飛ばす場合
        minConsts[i - 2] + (listH[i - 2] - listH[i]).abs()));
  }
  return minConsts[listH.length - 1];
}

void main() {
  test('pt.1', () => expect(solve([2, 9, 4, 5, 1, 6, 10]), 8));
}

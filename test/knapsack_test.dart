import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:tuple/tuple.dart';

/// N個の品物があり，i(＝0,1,...,N－1)番目の品物の重さはweighti，価値はvalueiで与えられます．
/// このN個の品物から，重さの総和がWを超えないように，いくつか選びます．選んだ品物の価値の総和として考えられる最大値を求めてください(ただし，Wやweightiは０以上の整数とします)．

int solve(int W, List<Tuple2<int, int>> items) {
  return 0;
}

void main() {
  test(
      'pt.1',
      () => expect(
          solve(11, [
            Tuple2(2, 3),
            Tuple2(1, 2),
            Tuple2(3, 6),
            Tuple2(2, 1),
            Tuple2(1, 3),
            Tuple2(5, 85)
          ]),
          96));
}

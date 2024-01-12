import 'dart:math';

class CalcLevenshtein {
  static List<int> calc(String query, List<String> data) {
    List<int> result = [];
    for (String d in data) {
      result.add(_levenshtein(query, d));
    }
    return result;
  }

  /// レーベンシュタインで10よりもソートしたインデックスが大きくなったら、リターン
  static List<String> changeIndex(
      List<int> levenshteinIndex, List<String> data) {
    int maxValue = levenshteinIndex
        .reduce((value, element) => value > element ? value : element);
    List<String> customSort = [];
    for (int i = 0; i <= maxValue; i++) {
      for (int j = 0; j < levenshteinIndex.length; j++) {
        if (levenshteinIndex[j] == i) {
          customSort.add(data[j]);
        }
      }
      if (customSort.length > 10) {
        return customSort;
      }
    }
    return customSort;
  }

  static int _levenshtein(String s, String t, {bool caseSensitive = true}) {
    if (!caseSensitive) {
      s = s.toLowerCase();
      t = t.toLowerCase();
    }
    if (s == t) {
      return 0;
    }
    if (s.isEmpty) {
      return t.length;
    }
    if (t.isEmpty) {
      return s.length;
    }

    List<int> v0 = List<int>.filled(t.length + 1, 0);
    List<int> v1 = List<int>.filled(t.length + 1, 0);

    for (int i = 0; i < t.length + 1; i < i++) {
      v0[i] = i;
    }

    for (int i = 0; i < s.length; i++) {
      v1[0] = i + 1;

      for (int j = 0; j < t.length; j++) {
        int cost = (s[i] == t[j]) ? 0 : 1;
        v1[j + 1] = min(v1[j] + 1, min(v0[j + 1] + 1, v0[j] + cost));
      }

      for (int j = 0; j < t.length + 1; j++) {
        v0[j] = v1[j];
      }
    }
    return v1[t.length];
  }
}

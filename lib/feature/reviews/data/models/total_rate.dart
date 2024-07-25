class TotalRate {
  final int zero;
  final int one;
  final int two;
  final int three;
  final int four;
  final int five;

  TotalRate({
    required this.zero,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
  });

  // Factory constructor to create a CntRates from JSON
  factory TotalRate.fromJson(Map<String, dynamic> json) {
    return TotalRate(
      zero: json['0'] ?? 0,
      one: json['1'] ?? 0,
      two: json['2'] ?? 0,
      three: json['3'] ?? 0,
      four: json['4'] ?? 0,
      five: json['5'] ?? 0,
    );
  }

  // Method to convert a CntRates to JSON
  Map<String, dynamic> toJson() {
    return {
      '0': zero,
      '1': one,
      '2': two,
      '3': three,
      '4': four,
      '5': five,
    };
  }
}

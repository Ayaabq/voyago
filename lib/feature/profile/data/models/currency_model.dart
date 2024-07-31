class CurrencyModel{
  final double ucd;
   final double syp;
  final double eur;

  CurrencyModel({required this.ucd, required this.syp, required this.eur});
  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        ucd: (json["USD"] as num).toDouble(),
        syp: (json["EUR"]as num).toDouble(),
        eur: (json["EUR"]as num).toDouble()

    );
  }
   toSYP(double price){
    return (price*syp);
  }
   toEUR(double price){
    return (price* eur);
  }

}
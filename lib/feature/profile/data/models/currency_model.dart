class CurrencyModel{
  final double ucd;
   final double syp;
  final double eur;

  CurrencyModel({required this.ucd, required this.syp, required this.eur});
  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        ucd: json["USD"],
        syp: json["EUR"],
        eur: json["EUR"]

    );
  }
   toSYP(double price){
    return (price*syp);
  }
   toEUR(double price){
    return (price* eur);
  }

}
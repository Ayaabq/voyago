import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import '../../../destination/data/models/destination_model.dart';

class TripInfo3PlacesModel {
  final DestinationModel destination;
  final List<AttractionModel>? attractions;

  TripInfo3PlacesModel({
    required this.destination,
    this.attractions,
  });

  factory TripInfo3PlacesModel.fromJson(Map<String, dynamic> json) {
    return TripInfo3PlacesModel(
      destination: DestinationModel.fromJson(json['Destenation']),
      // attractions: json['Attraction'] != null
      //     ? List<AttractionModel>.from(json['Attraction'].map((x) => AttractionModel.fromJson(x)))
      //     : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Destenation': destination.toJson(),
      'Attraction': attractions != null
          ? List<dynamic>.from(attractions!.map((x) => x.toJson()))
          : null,
    };
  }
}

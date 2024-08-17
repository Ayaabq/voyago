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
      attractions: json['Attraction'] != null
          ? List<AttractionModel>.from(json['Attraction'].map((x) => AttractionModel.fromJson(x)))
          : null,
    );
  }
  factory TripInfo3PlacesModel.fromJsonPrev(Map<String, dynamic> json) {
    return TripInfo3PlacesModel(
      destination: DestinationModel.fromJson(json['destination']),
      attractions:
      (json['attractions'] != null&& (json['attractions'] as List).isNotEmpty)
          ?
(    List<AttractionModel>.from(json['attractions'].map((e) => AttractionModel(id: e['AttractionId'], name: e['name'], isFavourite: e['is_favourite'], rate: double.parse(e['rate']))))
)          : [],
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

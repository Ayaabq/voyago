
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/core/presentation/manager/destination_cubit/destination_state.dart';
import 'package:voyago/feature/core/presentation/manager/favotire_destination_cubit/favorite_destination_state.dart';

import '../../../../core/data/enums/destination_enum.dart';
import '../models/destination_model.dart';



abstract class CoreRepo {
  Future<Either<Failure, DestinationSuccess>> getDestination(DestinationListType type);
  Future<Either<Failure, ChangeDestinationFavouriteSuccess>> addDestination2Favourite(DestinationModel destinationModel);
}

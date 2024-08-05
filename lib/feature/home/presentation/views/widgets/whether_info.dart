import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/home/data/models/weather_model.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_cubit.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_state.dart';
import 'package:voyago/feature/location&map/presentation/manager/location_cubit.dart';
import 'package:voyago/feature/location&map/presentation/manager/location_state.dart';

import 'app_bar/location_icon_button.dart';

class WhetherInfo extends StatefulWidget {
  const WhetherInfo({super.key, required this.degree, required this.country});
  final int degree;
  final String country;

  @override
  _WhetherInfoState createState() => _WhetherInfoState();
}

class _WhetherInfoState extends State<WhetherInfo> {
  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, locationState) {
        if (locationState is LocationLoaded) {
          final locationData = locationState.locationData;
          context.read<WeatherCubit>().fetchWeather(locationData.latitude!, locationData.longitude!);

          return BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, weatherState) {
              if (weatherState is WeatherSuccess) {
                final WeatherModel weatherModel = weatherState.weatherModel;

                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${weatherModel.celsiusTemp}℃  ",
                          style: Styles.textStyle32W700.copyWith(color: CustomColors.kWhite[0]),
                        ),
                        Text(
                          weatherModel.address,
                          style: Styles.textStyle20W700.copyWith(color: CustomColors.kWhite[0]),
                        ),

                      ],
                    ),
                    Text(
                      weatherModel.description,
                      style: Styles.textStyle16W700.copyWith(color: CustomColors.kMove[7]),
                    )
                  ],
                );
              } else if (weatherState is WeatherFailure) {
                return CustomFailureError(errMessage: weatherState.errorMessage);
              } else {
                return LoadBase(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Container(
                            width: 100,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 180,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        } else if (locationState is LocationError) {
          return CustomFailureError(errMessage: locationState.message);
        } else {
          return LoadBase(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

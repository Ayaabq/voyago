import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/home/data/models/weather_model.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_cubit.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_state.dart';

class WhetherInfo extends StatelessWidget {
  const WhetherInfo({super.key, required this.degree, required this.country});
  final int degree;
  final String country;
  @override
  Widget build(BuildContext context) {
    context.read<WeatherCubit>().fetchWeather(33.510414,36.278336
    );
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          final WeatherModel weatherModel= state.weatherModel;

        return Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "${weatherModel.celsiusTemp}℃  ",
                style: Styles.textStyle32W700
                    .copyWith(color: CustomColors.kWhite[0]),
              ),
              Text(
                weatherModel.address,
                style: Styles.textStyle20W700
                    .copyWith(color: CustomColors.kWhite[0]),
              )
            ],
          );
        } else if (state is WeatherFailure) {
          return CustomFailureError(errMessage: state.errorMessage);
        } else {
          return LoadBase(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  " X℃  ",
                  style: Styles.textStyle32W700
                      .copyWith(color: CustomColors.kWhite[0]),
                ),
                Text(
                  "country",
                  style: Styles.textStyle20W700
                      .copyWith(color: CustomColors.kWhite[0]),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

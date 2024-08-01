import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/styles.dart';

import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/profile/presentation/manager/currency_cubit/currency_cubit.dart';
import 'package:voyago/feature/profile/presentation/manager/currency_cubit/currency_state.dart';

import '../../../../core/helper/localization_checker.dart';
import '../../../../core/utils/custom_colors.dart';
import '../../../theme/widgets/cubit/app_theme_cubit.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late String selectedLanguage = "تنل";
  bool isDarkTheme = false;

  bool isNotificationsEnabled = true;

  // _onCurrencyChange(newCurrency)async{
  //   print(newCurrency);
  //   if(currencyManager.currencyModel==null) {
  //     await currencyManager.fetchCurrency();
  //   }
  //     if(newCurrency=="SYP"){
  //        currencyManager.toSYP();
  //       print(currencyManager.selectedCurrency);
  //     }else if(newCurrency=="EUR"){
  //        currencyManager.toEUR();
  //     }else{
  //       currencyManager.toUSD();
  //     }
  // }
  void _onCurrencyChange(String newCurrency) async {
    final currencyCubit = context.read<CurrencyCubit>();
    print('Currency changing to $newCurrency');

    if (currencyCubit.currencyModel == null) {
      await currencyCubit.fetchCurrency();
      // Check if currencyModel is still null after fetch attempt
      if (currencyCubit.currencyModel == null) {
        print('Failed to fetch currency data');
        currencyCubit.toUSD();

        return; // Exit if fetching failed
      }
    }

    // Continue with the logic to change currency
    if (newCurrency == "SYP") {
      currencyCubit.toSYP();
    } else if (newCurrency == "EUR") {
      currencyCubit.toEUR();
    } else {
      currencyCubit.toUSD();
    }
    print(currencyCubit.exchanger);
    print(currencyCubit.exchanger);
    print(currencyCubit.exchanger);
    print(currencyCubit.exchanger);
    print(currencyCubit.exchanger);
    print(currencyCubit.exchanger);
    print(currencyCubit.exchanger);
  }

  @override
  Widget build(BuildContext context) {
    selectedLanguage =
        context.locale.languageCode == "en" ? 'English'.tr() : 'Arabic'.tr();
    context.read<CurrencyCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.transparent
            : CustomColors.kGrey[0],
        title: Text("Settings".tr()),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.kMove[4],
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          LanguageRow(
            selectedLanguage: selectedLanguage,
            onLanguageChanged: (newLanguage) {
              setState(() {
                selectedLanguage = newLanguage;
              });
            },
          ),
          Divider(color: CustomColors.kGrey[0], height: 1),
          BlocConsumer<CurrencyCubit, CurrencyState>(
            listener: (context, state) {
              if (state is CurrencyLoading) {
                context.showLoadingToast();
              } else if (state is CurrencySuccess) {
                context.showSuccessToast("currency uploaded from server");
              }
              if (state is CurrencyFailure) {
                context.showFailureToast(state.errorMessage);
              }
            },
            builder: (context, state) {
              return CurrencyRow(
                  selectedCurrency: state.selectedCurrency,
                  onCurrencyChanged: _onCurrencyChange);
            },
          ),
          Divider(color: CustomColors.kGrey[0], height: 1),
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return ThemeSwitchRow(
                // isDarkTheme: isDarkTheme,
                // onThemeChanged: (value) {
                //   setState(() {});
                //   context.read<ThemeCubit>().toggleTheme();

                isDarkTheme: theme.brightness == Brightness.dark,
                onThemeChanged: (value) {
                  setState(() {});
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
          // ThemeSwitchRow(
          //   isDarkTheme: isDarkTheme,
          //   onThemeChanged: (value) {
          //     // setState(() {
          //     //   isDarkTheme = value;
          //     // });
          //     context.read<ThemeCubit>().toggleTheme();
          //   },
          // ),
          Divider(color: CustomColors.kGrey[0], height: 1),
          NotificationSwitchRow(
            isNotificationsEnabled: isNotificationsEnabled,
            onNotificationsChanged: (value) {
              setState(() {
                isNotificationsEnabled = value;
              });
            },
          ),
          Divider(color: CustomColors.kGrey[0], height: 1),
        ],
      ),
    );
  }
}

class LanguageRow extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const LanguageRow({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsRow(
      label: 'Language'.tr(),
      value: selectedLanguage,
      onPressed: () => _showLanguagePicker(context),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'.tr()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('English'.tr()),
                  onTap: () {
                    onLanguageChanged('English');

                    LocalizationChecker.changeLanguage(
                        context, const Locale("en"));

                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text('Arabic'.tr()),
                  onTap: () {
                    onLanguageChanged('Arabic');
                    LocalizationChecker.changeLanguage(
                        context, const Locale("ar"));

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CurrencyRow extends StatelessWidget {
  final String selectedCurrency;
  final ValueChanged<String> onCurrencyChanged;

  const CurrencyRow({
    super.key,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsRow(
      label: 'Currency'.tr(),
      value: selectedCurrency,
      onPressed: () => _showCurrencyPicker(context),
    );
  }

  void _showCurrencyPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Currency'.tr()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('USD'),
                  onTap: () {
                    onCurrencyChanged('USD');
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text('EUR'),
                  onTap: () {
                    onCurrencyChanged('EUR');
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text('SYP'),
                  onTap: () {
                    onCurrencyChanged('SYP');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ThemeSwitchRow extends StatelessWidget {
  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;

  const ThemeSwitchRow({
    super.key,
    required this.isDarkTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSwitchRow(
      label: 'Dark Theme'.tr(),
      value: isDarkTheme,
      onChanged: onThemeChanged,
      activeColor: CustomColors.kMove[6],
      inactiveColor: CustomColors.kGrey[2],
      thumbColor: CustomColors.kWhite[4],
    );
  }
}

class NotificationSwitchRow extends StatelessWidget {
  final bool isNotificationsEnabled;
  final ValueChanged<bool> onNotificationsChanged;

  const NotificationSwitchRow({
    super.key,
    required this.isNotificationsEnabled,
    required this.onNotificationsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSwitchRow(
      label: 'Notifications'.tr(),
      value: isNotificationsEnabled,
      onChanged: onNotificationsChanged,
      activeColor: CustomColors.kMove[6],
      inactiveColor: CustomColors.kGrey[2],
      thumbColor: CustomColors.kWhite[4],
    );
  }
}

class SettingsRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onPressed;

  const SettingsRow({
    super.key,
    required this.label,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  Styles.textStyle16W700.copyWith(fontWeight: FontWeight.w600)),
          Row(
            children: [
              Text(value, style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;

  const SettingsSwitchRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  Styles.textStyle16W700.copyWith(fontWeight: FontWeight.w600)),
          Switch(
            value: value,
            onChanged: onChanged,
            inactiveTrackColor: inactiveColor.withOpacity(0.1),
            activeColor: activeColor,
            inactiveThumbColor: inactiveColor,
            activeTrackColor: thumbColor,
          ),
        ],
      ),
    );
  }
}

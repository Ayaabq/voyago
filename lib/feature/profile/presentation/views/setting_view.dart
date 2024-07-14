import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/styles.dart';

import '../../../../core/utils/custom_colors.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String selectedLanguage = 'English';
  String selectedCurrency = 'USD';
  bool isDarkTheme = false;
  bool isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: CustomColors.kGrey[0],
        title: const Text('Settings'),
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
          CurrencyRow(
            selectedCurrency: selectedCurrency,
            onCurrencyChanged: (newCurrency) {
              setState(() {
                selectedCurrency = newCurrency;
              });
            },
          ),
          Divider(color: CustomColors.kGrey[0], height: 1),
          ThemeSwitchRow(
            isDarkTheme: isDarkTheme,
            onThemeChanged: (value) {
              setState(() {
                isDarkTheme = value;
              });
            },
          ),
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
      label: 'Language',
      value: selectedLanguage,
      onPressed: () => _showLanguagePicker(context),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('English'),
                  onTap: () {
                    onLanguageChanged('English');
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text('Spanish'),
                  onTap: () {
                    onLanguageChanged('Spanish');
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
      label: 'Currency',
      value: selectedCurrency,
      onPressed: () => _showCurrencyPicker(context),
    );
  }

  void _showCurrencyPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Currency'),
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
                  child: const Text('EUR€'),
                  onTap: () {
                    onCurrencyChanged('EUR€');
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
      label: 'Dark Theme',
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
      label: 'Notifications',
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

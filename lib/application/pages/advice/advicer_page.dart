import 'package:advicer_app/application/core/services/theme_service.dart';
import 'package:advicer_app/application/pages/advice/widgets/advice_field.dart';
import 'package:advicer_app/application/pages/advice/widgets/get_advice_button.dart';
import 'package:advicer_app/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final themeProvider = Provider.of<ThemeService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: themeProvider.isDarkModeOn,
            onChanged: (_) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          ErrorMessage(errorMessage: 'errorMessage'),
          Expanded(
            child: Center(
              child: AdviceField(
                  advice: 'example advice should exist in here!!!!!!!!'),
            ),
          ),
          SizedBox(
            height: 200,
            child: Center(
              child: GetAdviceButton(),
            ),
          ),
        ],
      ),
    );
  }
}

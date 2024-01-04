import 'package:advicer_app/application/core/services/theme_service.dart';
import 'package:advicer_app/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer_app/application/pages/advice/widgets/advice_field.dart';
import 'package:advicer_app/application/pages/advice/widgets/get_advice_button.dart';
import 'package:advicer_app/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicerPage(),
    );
  }
}

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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: BlocBuilder<AdvicerBloc, AdvicerState>(
                builder: (context, state) {
                  if (state is AdvicerInitial) {
                    return Text(
                      'Your Advice is waiting for you!',
                      style: themeData.textTheme.displayLarge,
                    );
                  } else if (state is AdvicerStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary,
                    );
                  } else if (state is AdvicerStateLoaded) {
                    return AdviceField(
                      advice: state.advice,
                    );
                  } else if (state is AdvicerStateError) {
                    return ErrorMessage(errorMessage: state.errorMessage);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          const SizedBox(
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

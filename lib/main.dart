import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_tdd2/src/app.dart';
import 'package:json_placeholder_tdd2/src/di/di.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/bloc/bloc/user_bloc.dart';
import 'package:json_placeholder_tdd2/src/services/logger_service.dart';

void main() async {
  // DEPENDNCY INJECTION
  setupInjection();
  // APP RUNNING IN GAURD
  runZonedGuarded(
    () {
      runApp(getBlocProvidedApp(MyApp()));
    },
    ((error, stack) {
      getIt<LoggerService>().appLogs(log: error.toString(), stackTrace: stack);
    }),
  );
}

// BLOC PROVIDED APP
Widget getBlocProvidedApp(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<UserBloc>(),
      ),
    ],
    child: child,
  );
}

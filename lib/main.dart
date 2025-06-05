import 'package:remindery/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:remindery/features/counter/presentation/screen/counter_screen.dart';
import 'package:remindery/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_alice/console/presentation/bloc/console_message_debugger_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import 'core/di/dependency_injection.dart';
import 'core/widget/flutter_error_state_widget.dart';
import 'utils/colors/hex_colors.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void mainApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor(backgroundColor1),
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));

  await initDepInject();

  final blocProviders = [
    BlocProvider<ConsoleMessageDebuggerBloc>(
      create: (context) => ConsoleMessageDebuggerBloc(),
    ),
    BlocProvider<CounterBloc>(
      create: (context) => getIt(),
    ),
    BlocProvider<PokemonBloc>(
      create: (context) => getIt(),
    ),
  ];

  ErrorWidget.builder = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    return FlutterErrorStateWidget(details);
  };

  runApp(
    MultiBlocProvider(
      providers: blocProviders,
      child: const OverlaySupport.global(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

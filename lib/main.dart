import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_app/core/configuration/bloc/config_bloc.dart';
import 'package:mobile_app/core/configuration/bloc/config_state.dart';
import 'package:mobile_app/core/services/api_service.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/core/services/preferences_service.dart';
import 'package:mobile_app/utills/app_routes.dart';
import 'package:mobile_app/utills/common_barrel.dart';
import 'package:mobile_app/utills/router_delegate.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(kReleaseMode);

      final storage = await HydratedStorage.build(
        storageDirectory: await getTemporaryDirectory(),
      );

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
        ),
      );

      HydratedBlocOverrides.runZoned(
        () => runApp(const App()),
        storage: storage,
      );
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConfigBloc(
            dateTime: DateTime.now(),
            sharedPrefs: PreferencesService(),
          ),
        ),
      ],
      child: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final routerDelegate = AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (context, state) {
        if (state.appState == AppState.initial) {
          //TODO check for signIn and splash
          context.read<ConfigBloc>().add(const LocaleEvent());
        }
        return MaterialApp(
          title: 'App Title',
          debugShowCheckedModeBanner: false,
          theme: state.themeType.theme.themeData,
          navigatorKey: ApiService().alice.getNavigatorKey(),
          localizationsDelegates: const [
            StringsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            // Locale('ko', ''),
          ],
          locale: Locale(state.locale),
          home: Router(
            routerDelegate: routerDelegate,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        );
      },
    );
  }
}

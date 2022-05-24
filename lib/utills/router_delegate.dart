import 'package:flutter/material.dart';
import 'package:mobile_app/modules/landing/ui/landing_screen.dart';
import 'package:mobile_app/utills/app_routes.dart';

class AppRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  factory AppRouterDelegate() {
    return _instance;
  }
  AppRouterDelegate._internal();

  static final AppRouterDelegate _instance = AppRouterDelegate._internal();

  final _pages = <Page>[];

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: List.of(_pages),
      key: navigatorKey,
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    throw UnimplementedError();
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmAppExit();
  }

  Future<bool> _confirmAppExit() async {
    return (await showDialog<bool>(
          context: _navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Are you sure you want to exit the app?'),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context, true),
                ),
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            );
          },
        )) ??
        false;
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  void pushPage({@required String? name, dynamic arguments}) {
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  void pushAndRemoveUntilPage({@required String? name, dynamic arguments}) {
    _pages.clear();
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  void pushAndReplacePage({@required String? name, dynamic arguments}) {
    if (_pages.length > 1) _pages.removeLast();

    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget? child;

    switch (routeSettings.name) {
      case AppRouteConstants.landingPage:
        child = const LandingScreen();
        break;
    }

    return MaterialPage(
      child: child!,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
      key: ObjectKey(routeSettings.name),
    );
  }
}

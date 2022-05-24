flutter clean
flutter pub get
flutter pub run environment_config:generate --config-extension=stage
flutter pub run build_runner build --delete-conflicting-outputs

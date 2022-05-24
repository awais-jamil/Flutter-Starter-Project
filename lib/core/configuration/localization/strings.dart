import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/configuration/localization/languages/english.dart';

class Strings {
  const Strings(this.locale);

  final Locale locale;

  static Strings of(BuildContext context) =>
      Localizations.of<Strings>(context, Strings)!;

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': english,
    'ko': english,
  };

  String get reactNeuro =>
      _localizedValues[locale.languageCode]!['reactNeuro']!;

  String get welcomeToReact =>
      _localizedValues[locale.languageCode]!['welcomeToReact']!;

  String get signIn => _localizedValues[locale.languageCode]!['signIn']!;

  String get email => _localizedValues[locale.languageCode]!['email']!;

  String get enterEmail =>
      _localizedValues[locale.languageCode]!['enterEmail']!;

  String get pleaseEnterEmail =>
      _localizedValues[locale.languageCode]!['pleaseEnterEmail']!;

  String get validEmail =>
      _localizedValues[locale.languageCode]!['validEmail']!;

  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get phoneNumber =>
      _localizedValues[locale.languageCode]!['phoneNumber']!;

  String get enterPassword =>
      _localizedValues[locale.languageCode]!['enterPassword']!;

  String get pleaseEnterPassword =>
      _localizedValues[locale.languageCode]!['pleaseEnterPassword']!;

  String get makeSureYourPasswordMatch =>
      _localizedValues[locale.languageCode]!['makeSureYourPasswordMatch']!;

  String get forgotPassword =>
      _localizedValues[locale.languageCode]!['forgotPassword']!;

  String get changePassword =>
      _localizedValues[locale.languageCode]!['changePassword']!;

  String get newPassword =>
      _localizedValues[locale.languageCode]!['newPassword']!;

  String get enterNewPassword =>
      _localizedValues[locale.languageCode]!['enterNewPassword']!;

  String get confirmNewPassword =>
      _localizedValues[locale.languageCode]!['confirmNewPassword']!;

  String get showPassword =>
      _localizedValues[locale.languageCode]!['showPassword']!;

  String get currentPassword =>
      _localizedValues[locale.languageCode]!['currentPassword']!;

  String get confirmPassword =>
      _localizedValues[locale.languageCode]!['confirmPassword']!;

  String get learnMore => _localizedValues[locale.languageCode]!['learnMore']!;

  String get wantToLearnMore =>
      _localizedValues[locale.languageCode]!['wantToLearnMore']!;

  String get trainYourBrain =>
      _localizedValues[locale.languageCode]!['trainYourBrain']!;

  String get all => _localizedValues[locale.languageCode]!['all']!;

  String get favorites => _localizedValues[locale.languageCode]!['favorites']!;

  String get mostViewed =>
      _localizedValues[locale.languageCode]!['mostViewed']!;

  String get highest => _localizedValues[locale.languageCode]!['highest']!;

  String get thingsYouCanDoToPracticeEmotionalWellbeing => _localizedValues[
      locale.languageCode]!['thingsYouCanDoToPracticeEmotionalWellbeing']!;

  String get yourBrainAndSleep =>
      _localizedValues[locale.languageCode]!['yourBrainAndSleep']!;

  String get howSleepHelps =>
      _localizedValues[locale.languageCode]!['howSleepHelps']!;
  String get howYourBrain =>
      _localizedValues[locale.languageCode]!['howYourBrain']!;

  String get whyYourDietMatters =>
      _localizedValues[locale.languageCode]!['whyYourDietMatters']!;
  String get youNeedAtleast7 =>
      _localizedValues[locale.languageCode]!['youNeedAtleast7']!;
  String get toPracticeAndImprove =>
      _localizedValues[locale.languageCode]!['toPracticeAndImprove']!;
  String get thingsYouCanDo =>
      _localizedValues[locale.languageCode]!['thingsYouCanDo']!;
  String get trainings => _localizedValues[locale.languageCode]!['trainings']!;
  String get training => _localizedValues[locale.languageCode]!['training']!;
  String get trends => _localizedValues[locale.languageCode]!['trends']!;
  String get excellent => _localizedValues[locale.languageCode]!['excellent']!;
  String get average => _localizedValues[locale.languageCode]!['average']!;
  String get decreased => _localizedValues[locale.languageCode]!['decreased']!;
  String get myProfile => _localizedValues[locale.languageCode]!['myProfile']!;
  String get metrics => _localizedValues[locale.languageCode]!['metrics']!;
  String get personalInformation =>
      _localizedValues[locale.languageCode]!['personalInformation']!;
  String get highlights =>
      _localizedValues[locale.languageCode]!['highlights']!;
  String get informationDialogDetails =>
      _localizedValues[locale.languageCode]!['informationDialogDetails']!;
  String get description =>
      _localizedValues[locale.languageCode]!['description']!;

  String get weWillSendYouACode =>
      _localizedValues[locale.languageCode]!['weWillSendYouACode']!;
  String get sendInstruction =>
      _localizedValues[locale.languageCode]!['sendInstruction']!;

  String get error => _localizedValues[locale.languageCode]!['error']!;

  String get internetNotAvailable =>
      _localizedValues[locale.languageCode]!['internetNotAvailable']!;

  String get success => _localizedValues[locale.languageCode]!['success']!;

  String get forgotPasswordSuccessMessage =>
      _localizedValues[locale.languageCode]!['forgotPasswordSuccessMessage']!;

  String get somethingWentWrong =>
      _localizedValues[locale.languageCode]!['somethingWentWrong']!;
  String get youAreGoingToChangePassword =>
      _localizedValues[locale.languageCode]!['youAreGoingToChangePassword']!;
  String get ok => _localizedValues[locale.languageCode]!['ok']!;
  String get pleaseEnterValidPassword =>
      _localizedValues[locale.languageCode]!['pleaseEnterValidPassword']!;
  String get passwordInvalid =>
      _localizedValues[locale.languageCode]!['passwordInvalid']!;
  String get changePasswordSuccessMessage =>
      _localizedValues[locale.languageCode]!['changePasswordSuccessMessage']!;

  String get passwordComplexityMessage =>
      _localizedValues[locale.languageCode]!['passwordComplexityMessage']!;

  String get logout => _localizedValues[locale.languageCode]!['logout']!;
  String get allowNotification =>
      _localizedValues[locale.languageCode]!['allowNotification']!;
  String get accountSetting =>
      _localizedValues[locale.languageCode]!['accountSetting']!;
  String get managePermissions =>
      _localizedValues[locale.languageCode]!['managePermissions']!;
  String get appSettings =>
      _localizedValues[locale.languageCode]!['appSettings']!;
  String get darkMode => _localizedValues[locale.languageCode]!['darkMode']!;
  String get termsConditions =>
      _localizedValues[locale.languageCode]!['termsConditions']!;
  String get editNickName =>
      _localizedValues[locale.languageCode]!['editNickName']!;
  String get nickName => _localizedValues[locale.languageCode]!['nickName']!;
  String get nicknameMessage =>
      _localizedValues[locale.languageCode]!['nicknameMessage']!;
  String get done => _localizedValues[locale.languageCode]!['done']!;
  String get nicknameUpdatedMsg =>
      _localizedValues[locale.languageCode]!['nicknameUpdatedMsg']!;
  String get pleaseEnterNickName =>
      _localizedValues[locale.languageCode]!['pleaseEnterNickName']!;
  String get enterNickName =>
      _localizedValues[locale.languageCode]!['enterNickName']!;
  String get your => _localizedValues[locale.languageCode]!['your']!;
  String get passwordMustContain =>
      _localizedValues[locale.languageCode]!['passwordMustContain']!;
  String get update => _localizedValues[locale.languageCode]!['update']!;
  String get lastUpdated =>
      _localizedValues[locale.languageCode]!['lastUpdated']!;
  String get summary => _localizedValues[locale.languageCode]!['summary']!;
  String get connections =>
      _localizedValues[locale.languageCode]!['connections']!;
  String get youEnrolledInANewProgramm =>
      _localizedValues[locale.languageCode]!['youEnrolledInANewProgramm']!;
  String get baseline => _localizedValues[locale.languageCode]!['baseline']!;
  String get healthyRange =>
      _localizedValues[locale.languageCode]!['healthyRange']!;
  String get belowExpectedRange =>
      _localizedValues[locale.languageCode]!['belowExpectedRange']!;
  String get withinExpectedRange =>
      _localizedValues[locale.languageCode]!['withinExpectedRange']!;
  String get graph => _localizedValues[locale.languageCode]!['graph']!;
  String get revokedAccessFrom =>
      _localizedValues[locale.languageCode]!['revokedAccessFrom']!;
  String get grantedAccessTo =>
      _localizedValues[locale.languageCode]!['grantedAccessTo']!;
  String get lastAccessed =>
      _localizedValues[locale.languageCode]!['lastAccessed']!;
  String get signout => _localizedValues[locale.languageCode]!['signout']!;
  String get wantToQuit =>
      _localizedValues[locale.languageCode]!['wantToQuit']!;
  String get performanceOverTime =>
      _localizedValues[locale.languageCode]!['performanceOverTime']!;
}

class StringsDelegate extends LocalizationsDelegate<Strings> {
  const StringsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ko'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) =>
      SynchronousFuture<Strings>(Strings(locale));

  @override
  bool shouldReload(StringsDelegate old) => false;
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get Like => "Like";
  String get about => "About";
  String get actionCancel => "Cancel";
  String get actionConfirm => "Confirm";
  String get appName => "Khanily";
  String get appUpdateActionDownloadAgain => "Download";
  String get appUpdateActionInstallApk => "Install";
  String get appUpdateActionUpdate => "Update";
  String get appUpdateCheckUpdate => "Check Update";
  String get appUpdateDoubleBackTips => "Press back again, cancel download";
  String get appUpdateDownloadCanceled => "Download canceled";
  String get appUpdateDownloadFailed => "Download failed";
  String get appUpdateDownloading => "Downloading...";
  String get appUpdateLeastVersion => "Least version now ";
  String get appUpdateReDownloadContent =>
      "It has been detected that it has been downloaded, whether it is installed?";
  String get appUpdateUpdate => "Version Update";
  String get article_tag_top => "Top";
  String get autoBySystem => "Auto";
  String get clear => "Clear";
  String get close => "Close";
  String get coin => "Coin";
  String get collectionRemove => "Remove";
  String get darkMode => "Dark Mode";
  String get favourites => "Favorites";
  String get feedback => "FeedBack";
  String get fieldNotNull => "not empty";
  String get fontKuaiLe => "ZCOOL KuaiLe";
  String get githubIssue => "Can't find mail app,please github issues";
  String get loadFailed => "Load failed,retry later";
  String get logout => "Sign Out";
  String get myFavourites => "My favourites";
  String get needLogin => "Go to Sign In";
  String get noAccount => "No Account ? ";
  String get openBrowser => "Open Browser";
  String get password => "Please input Password";
  String get rate => "Rate";
  String get rePassword => "Confirm Password";
  String get refresh => "Refresh";
  String get refreshTwoLevel => "release to enter second floor";
  String get retry => "Retry";
  String get searchHistory => "History";
  String get searchHot => "Hot";
  String get searchSuggest => "Track,album,artist,podcast";
  String get searchShake => "Shake";
  String get setting => "Setting";
  String get settingFont => "System Font";
  String get settingLanguage => "Language";
  String get share => "Share";
  String get signIn => "Sign In";
  String get signIn3thd => "More";
  String get welcome => "Welcome";
  String get signUp => "Sign Up";
  String get splashSkip => "Skip";
  String get tabSearch => "Search";
  String get searchResult => "Search Result:";
  String get tabMusic => "Music";
  String get tabFavorite => "Favorite";
  String get tabUser => "Me";
  String get theme => "Theme";
  String get toSignIn => "Sign In";
  String get albums => "Albums";
  String get viewAll => "View All";
  String get forYou => "For you";
  String get toSignUp => "Sign Up";
  String get twoPwdDifferent => "The two passwords differ";
  String get unLike => "UnLike";
  String get userName => "Please input Username";
  String get viewStateButtonLogin => "Sign In";
  String get viewStateButtonRefresh => "Refresh";
  String get viewStateButtonRetry => "Retry";
  String get viewStateMessageEmpty => "Nothing Found";
  String get viewStateMessageError => "Load Failed";
  String get viewStateMessageNetworkError => "Load Failed,Check network ";
  String get viewStateMessageUnAuth => "Not sign in yet";
  String get wechatAccount => "Wechat";
  String appUpdateFoundNewVersion(String version) => "New version $version";
}

class $en extends S {
  const $en();
}

class $zh_CN extends S {
  const $zh_CN();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get favourites => "المفضله";
  @override
  String get appUpdateLeastVersion => "النسخه الجديده";
  @override
  String get twoPwdDifferent => "الرقمان غير متطابقان";
  @override
  String get viewStateButtonRetry => "اعاده";
  @override
  String get about => "حول";
  @override
  String get unLike => "الغاء الاعجاب";
  @override
  String get signUp => "تسجيل";
  @override
  String get viewStateMessageEmpty => "لا يوجد شي";
  @override
  String get appUpdateActionInstallApk => "تنزيل";
  @override
  String get viewStateMessageUnAuth => "لم يتم تسجيل الدخول";
  @override
  String get setting => "الاعدادات";
  @override
  String get settingFont => "اعدادات الخط";
  @override
  String get feedback => "رأيك يهمنا";
  @override
  String get logout => "خروج";
  @override
  String get password => "الرقم السري";
  @override
  String get searchShake => "shake";
  @override
  String get Like => "أعجبني";
  @override
  String get viewStateMessageNetworkError => "عذرا هناك مشكله في الانترنت";
  @override
  String get appUpdateActionDownloadAgain => "تحميل";
  @override
  String get autoBySystem => "تلقائي";
  @override
  String get viewStateButtonRefresh => "تحديث";
  @override
  String get appUpdateDoubleBackTips => "اضغط مرة أخرى ، قم بإلغاء التنزيل";
  @override
  String get loadFailed => "تعذر الوصول";
  @override
  String get refreshTwoLevel => "حرر للدخول في الطابق الثاني";
  @override
  String get article_tag_top => "أعلى";
  @override
  String get appUpdateDownloadFailed => "التحميل فشل";
  @override
  String get appUpdateReDownloadContent =>
      "اكتشفت أنه تم تنزيل الإصدار محليًا ، هل تم تثبيته مباشرةً؟";
  @override
  String get noAccount => "لا تملك حسابا حتى الآن؟ ";
  @override
  String get openBrowser => "يفتح المتصفح";
  @override
  String get appUpdateActionUpdate => "تحديث";
  @override
  String get coin => "متكامل";
  @override
  String get splashSkip => "تخطي";
  @override
  String get collectionRemove => "إزالة المفضلة";
  @override
  String get actionConfirm => "تأكيد";
  @override
  String get fontKuaiLe => "خط سعيد";
  @override
  String get appUpdateCheckUpdate => "تحقق من وجود تحديثات";
  @override
  String get settingLanguage => "اللغه";
  @override
  String get myFavourites => "المفضله";
  @override
  String get signIn3thd => "تسجيل الدخول ب";
  @override
  String get welcome => "مرحبا";
  @override
  String get viewStateMessageError => "فشل في التحميل";
  @override
  String get rate => "قيمنا";
  @override
  String get actionCancel => "اغلاق";
  @override
  String get theme => "مظهر ";
  @override
  String get share => "مشاركه";
  @override
  String get appUpdateUpdate => "تحديث الإصدار الجديد";
  @override
  String get fieldNotNull => "لايمكن ان يكون فارغا";
  @override
  String get close => "اغلاق";
  @override
  String get retry => "اعاده المحاوله";
  @override
  String get wechatAccount => "الجمهور";
  @override
  String get toSignUp => "اذهب للتسجيل";
  @override
  String get appUpdateDownloading => "جاري التحميل ، برجاء الانتظار ...";
  @override
  String get appName => "غنيلي";
  @override
  String get tabUser => "أنا";
  @override
  String get clear => "حذف";
  @override
  String get needLogin => "الرجاء تسجيل الدخول أولا";
  @override
  String get refresh => "تحميل";
  @override
  String get toSignIn => "انقر لي لتسجيل الدخول";
  @override
  String get albums => "الالبومات";
  @override
  String get viewAll => "المزيد";
  @override
  String get forYou => "اخترنا لك";
  @override
  String get userName => "الاسم";
  @override
  String get appUpdateDownloadCanceled => "تم إلغاء التنزيل";
  @override
  String get tabSearch => "بحث";
  @override
  String get searchResult => "نتائج البحث:";
  @override
  String get tabMusic => "الموسيقي";
  @override
  String get tabFavorite => "المفضله";
  @override
  String get rePassword => "اكتب رقمك السري مرة اخري";
  @override
  String get signIn => "تسجيل الدخول";
  @override
  String get githubIssue =>
      "لم يتم العثور على عميل بريد إلكتروني ، يرجى الانتقال إلى github وتقديم مشكلة";
  @override
  String get viewStateButtonLogin => "تسجيل الدخول";
  @override
  String get searchHot => "عمليات البحث الشائعة";
  @override
  String get searchSuggest => "طرب كلاسيكي اندرجراوند";
  @override
  String get darkMode => "الوضع الليلي";
  @override
  String get searchHistory => "سجل البحث";
  @override
  String appUpdateFoundNewVersion(String version) =>
      "يرجي تحميل النسخه الجديده$version,ناو?";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("zh", "CN"),
    ];
  }

  LocaleListResolutionCallback listResolution(
      {Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution(
      {Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        case "zh_CN":
          S.current = const $zh_CN();
          return SynchronousFuture<S>(S.current);
        default:
        // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty
        ? l.languageCode
        : l.toString();

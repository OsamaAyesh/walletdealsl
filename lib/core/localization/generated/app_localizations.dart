import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @on_boarding_screen_page1_text1.
  ///
  /// In ar, this message translates to:
  /// **'جرب Wallet Deals مجانًا لمدة 7 أيام'**
  String get on_boarding_screen_page1_text1;

  /// No description provided for @on_boarding_screen_page1_text2.
  ///
  /// In ar, this message translates to:
  /// **'استمتع بأفضل العروض والخصومات من التجار حولك لمدة أسبوع كامل بدون أي تكلفة، واكتشف تجربة تسوق ذكية وسهلة!'**
  String get on_boarding_screen_page1_text2;

  /// No description provided for @on_boarding_screen_page1_text3.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get on_boarding_screen_page1_text3;

  /// No description provided for @on_boarding_screen_page2_text1.
  ///
  /// In ar, this message translates to:
  /// **'وفر أكثر، استمتع أكثر!'**
  String get on_boarding_screen_page2_text1;

  /// No description provided for @on_boarding_screen_page2_text2.
  ///
  /// In ar, this message translates to:
  /// **'احصل على خصومات حصرية بناءً على باقتك، وادفع أقل في كل عملية شراء، مع التاجر المفضل لديك!'**
  String get on_boarding_screen_page2_text2;

  /// No description provided for @on_boarding_screen_page2_text3.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get on_boarding_screen_page2_text3;

  /// No description provided for @on_boarding_screen_page3_text1.
  ///
  /// In ar, this message translates to:
  /// **'سهولة الدفع والخصومات في جيبك'**
  String get on_boarding_screen_page3_text1;

  /// No description provided for @on_boarding_screen_page3_text2.
  ///
  /// In ar, this message translates to:
  /// **'مسح سريع لرمز QR ودفع نقدي مريح، لتتمتع بخصوماتك دون عناء، كل ذلك مع Wallet Deals!'**
  String get on_boarding_screen_page3_text2;

  /// No description provided for @on_boarding_screen_page3_text3.
  ///
  /// In ar, this message translates to:
  /// **'إبدء الآن '**
  String get on_boarding_screen_page3_text3;

  /// No description provided for @login_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login_screen_text1;

  /// No description provided for @login_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'مرحبا بك في تطبيق واليت ديلز'**
  String get login_screen_text2;

  /// No description provided for @login_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get login_screen_text3;

  /// No description provided for @login_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني الخاص بك'**
  String get login_screen_text4;

  /// No description provided for @login_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get login_screen_text5;

  /// No description provided for @login_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'**************'**
  String get login_screen_text6;

  /// No description provided for @login_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'هل نسيت كلمة المرور ؟'**
  String get login_screen_text7;

  /// No description provided for @login_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login_screen_text8;

  /// No description provided for @login_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'ليس لدي حساب بالفعل ؟'**
  String get login_screen_text9;

  /// No description provided for @login_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get login_screen_text10;

  /// No description provided for @error_dialog_in_sign_in1.
  ///
  /// In ar, this message translates to:
  /// **'فشل تسجيل الدخول!'**
  String get error_dialog_in_sign_in1;

  /// No description provided for @error_dialog_in_sign_in2.
  ///
  /// In ar, this message translates to:
  /// **'عذراً، حدث خطأ أثناء تسجيل الدخول . أو حسابك غير موجود حاول مرة أخرى لاحقا'**
  String get error_dialog_in_sign_in2;

  /// No description provided for @error_dialog_in_sign_in3.
  ///
  /// In ar, this message translates to:
  /// **'حاول مرة أخرى'**
  String get error_dialog_in_sign_in3;

  /// No description provided for @success_dialog_in_sign_in1.
  ///
  /// In ar, this message translates to:
  /// **'تم تسجيل الدخول بنجاح!'**
  String get success_dialog_in_sign_in1;

  /// No description provided for @success_dialog_in_sign_in2.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بعودتك! لقد تم تسجيل دخولك بنجاح، استمتع بتجربتك في التطبيق.'**
  String get success_dialog_in_sign_in2;

  /// No description provided for @sign_up_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'إنشــاء حســاب'**
  String get sign_up_screen_text1;

  /// No description provided for @sign_up_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'مرحبا بك في تطبيق واليت ديلز'**
  String get sign_up_screen_text2;

  /// No description provided for @sign_up_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'الإسم الأول'**
  String get sign_up_screen_text3;

  /// No description provided for @sign_up_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الأول '**
  String get sign_up_screen_text4;

  /// No description provided for @sign_up_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'الإسم العائلة'**
  String get sign_up_screen_text5;

  /// No description provided for @sign_up_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'الاسم العائلة'**
  String get sign_up_screen_text6;

  /// No description provided for @sign_up_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get sign_up_screen_text7;

  /// No description provided for @sign_up_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني الخاص بك'**
  String get sign_up_screen_text8;

  /// No description provided for @sign_up_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get sign_up_screen_text9;

  /// No description provided for @sign_up_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get sign_up_screen_text10;

  /// No description provided for @sign_up_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'المدينة'**
  String get sign_up_screen_text11;

  /// No description provided for @sign_up_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'أختر المنطقة '**
  String get sign_up_screen_text12;

  /// No description provided for @sign_up_screen_text13.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get sign_up_screen_text13;

  /// No description provided for @sign_up_screen_text14.
  ///
  /// In ar, this message translates to:
  /// **'********************'**
  String get sign_up_screen_text14;

  /// No description provided for @sign_up_screen_text15.
  ///
  /// In ar, this message translates to:
  /// **'هل توافق على سياسة الإستخدام'**
  String get sign_up_screen_text15;

  /// No description provided for @sign_up_screen_text16.
  ///
  /// In ar, this message translates to:
  /// **'سجل الآن'**
  String get sign_up_screen_text16;

  /// No description provided for @sign_up_screen_text17.
  ///
  /// In ar, this message translates to:
  /// **'لدي حساب بالفعل ؟'**
  String get sign_up_screen_text17;

  /// No description provided for @sign_up_screen_text18.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get sign_up_screen_text18;

  /// No description provided for @error_dialog_in_sign_up1.
  ///
  /// In ar, this message translates to:
  /// **'فشل إنشاء الحساب!'**
  String get error_dialog_in_sign_up1;

  /// No description provided for @error_dialog_in_sign_up2.
  ///
  /// In ar, this message translates to:
  /// **'عذراً، حدث خطأ أثناء إنشاء الحساب. حاول مرة أخرى لاحقاً.'**
  String get error_dialog_in_sign_up2;

  /// No description provided for @error_dialog_in_sign_up3.
  ///
  /// In ar, this message translates to:
  /// **'حاول مرة أخرى'**
  String get error_dialog_in_sign_up3;

  /// No description provided for @success_dialog_in_sign_up1.
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الحساب بنجاح!'**
  String get success_dialog_in_sign_up1;

  /// No description provided for @success_dialog_in_sign_up2.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك! تم إنشاء حسابك بنجاح، يمكنك الآن البدء في استخدام التطبيق.'**
  String get success_dialog_in_sign_up2;

  /// No description provided for @success_dialog_in_sign_up3.
  ///
  /// In ar, this message translates to:
  /// **'إبدء الاستخدام الآن'**
  String get success_dialog_in_sign_up3;

  /// No description provided for @forget_password_text1.
  ///
  /// In ar, this message translates to:
  /// **'إستعادة كلمة المرور '**
  String get forget_password_text1;

  /// No description provided for @forget_password_text2.
  ///
  /// In ar, this message translates to:
  /// **'استرجع كلمة مرورك الآن وأكمل رحلتك الممتعة في استكشاف أفضل العروض على Wallet Deals.'**
  String get forget_password_text2;

  /// No description provided for @forget_password_text3.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get forget_password_text3;

  /// No description provided for @forget_password_text4.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني الخاص بك'**
  String get forget_password_text4;

  /// No description provided for @forget_password_text5.
  ///
  /// In ar, this message translates to:
  /// **'أرسل كود التحقق'**
  String get forget_password_text5;

  /// No description provided for @verification_code_text1.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الرمز'**
  String get verification_code_text1;

  /// No description provided for @verification_code_text2.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رمز التحقق '**
  String get verification_code_text2;

  /// No description provided for @verification_code_text3.
  ///
  /// In ar, this message translates to:
  /// **'إعادة الإرسال   '**
  String get verification_code_text3;

  /// No description provided for @verification_code_text4.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد رمز التحقق'**
  String get verification_code_text4;

  /// No description provided for @error_dialog_verification_code1.
  ///
  /// In ar, this message translates to:
  /// **'الكود غير متطابق'**
  String get error_dialog_verification_code1;

  /// No description provided for @error_dialog_verification_code2.
  ///
  /// In ar, this message translates to:
  /// **'الكود الذي أدخلته غير متطابق مع الكود المرسل إليك. يرجى التحقق والمحاولة مرة أخرى'**
  String get error_dialog_verification_code2;

  /// No description provided for @error_dialog_verification_code3.
  ///
  /// In ar, this message translates to:
  /// **'حاول مرة أخرى'**
  String get error_dialog_verification_code3;

  /// No description provided for @success_dialog_verification_code1.
  ///
  /// In ar, this message translates to:
  /// **'تمت عملية المصادقة'**
  String get success_dialog_verification_code1;

  /// No description provided for @success_dialog_verification_code2.
  ///
  /// In ar, this message translates to:
  /// **'قم بتغيير كلمة المرور وقم بوضع كلمة مرور قوية '**
  String get success_dialog_verification_code2;

  /// No description provided for @new_password_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كلمة المرور'**
  String get new_password_screen_text1;

  /// No description provided for @new_password_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال كلمة المرور الجديدة ثم كتابة كلمة المرور الجديدة  لحماية حسابك'**
  String get new_password_screen_text2;

  /// No description provided for @new_password_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الجديدة'**
  String get new_password_screen_text3;

  /// No description provided for @new_password_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'********************'**
  String get new_password_screen_text4;

  /// No description provided for @new_password_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور  الجديدة'**
  String get new_password_screen_text5;

  /// No description provided for @new_password_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'********************'**
  String get new_password_screen_text6;

  /// No description provided for @new_password_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كلمة المرور'**
  String get new_password_screen_text7;

  /// No description provided for @error_dialog_new_password_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'فشل في تغيير كلمة المرور'**
  String get error_dialog_new_password_screen_text1;

  /// No description provided for @error_dialog_new_password_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الجديدة وتأكيد كلمة المرور غير متطابقتين. يرجى التأكد وإعادة المحاولة'**
  String get error_dialog_new_password_screen_text2;

  /// No description provided for @error_dialog_new_password_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'حاول مرة أخرى'**
  String get error_dialog_new_password_screen_text3;

  /// No description provided for @success_dialog_new_password_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تم تغيير كلمة المرور بنجاح!'**
  String get success_dialog_new_password_screen_text1;

  /// No description provided for @success_dialog_new_password_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'لقد تم تحديث كلمة المرور الخاصة بك. تأكد من استخدام كلمة المرور الجديدة'**
  String get success_dialog_new_password_screen_text2;

  /// No description provided for @success_dialog_new_password_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'العودة الي شاشة تسجيل الدخول'**
  String get success_dialog_new_password_screen_text3;

  /// No description provided for @subscribe_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'اشتـــرك الآن '**
  String get subscribe_screen_text1;

  /// No description provided for @subscribe_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'اختر الخطة التي تفضلها '**
  String get subscribe_screen_text2;

  /// No description provided for @subscribe_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'اختر باقتك الآن واستمتع بخصومات حصرية على كل ما تحتاجه مع Wallet Deals!'**
  String get subscribe_screen_text3;

  /// No description provided for @subscribe_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'الخطة الرائجة'**
  String get subscribe_screen_text4;

  /// No description provided for @subscribe_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'مدة الإشتراك'**
  String get subscribe_screen_text5;

  /// No description provided for @subscribe_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'كل شهر '**
  String get subscribe_screen_text6;

  /// No description provided for @subscribe_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'القطاعات المشمولة '**
  String get subscribe_screen_text7;

  /// No description provided for @subscribe_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'الاشتراك في هذه الخطة'**
  String get subscribe_screen_text8;

  /// No description provided for @subscribe_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'إنطلق الآن مع خصومات واليت ديلز لمدة 7 أيام مجانا'**
  String get subscribe_screen_text9;

  /// No description provided for @subscribe_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'من الممكن تغيير الباقة التي قمت باختيارها بعد انتهاء الباقة المشترك بها او عن طريق التواصل معنا'**
  String get subscribe_screen_text10;

  /// No description provided for @main_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get main_screen_text1;

  /// No description provided for @main_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get main_screen_text2;

  /// No description provided for @main_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'الماسح الضوئي'**
  String get main_screen_text3;

  /// No description provided for @main_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'فواتيري'**
  String get main_screen_text4;

  /// No description provided for @main_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'برفايلي'**
  String get main_screen_text5;

  /// No description provided for @home_body_text1.
  ///
  /// In ar, this message translates to:
  /// **'الصفحة الرئيسية '**
  String get home_body_text1;

  /// No description provided for @home_body_text2.
  ///
  /// In ar, this message translates to:
  /// **'القطاعات المتاحة '**
  String get home_body_text2;

  /// No description provided for @home_body_text3.
  ///
  /// In ar, this message translates to:
  /// **'العروض القريبة منك'**
  String get home_body_text3;

  /// No description provided for @home_body_text4.
  ///
  /// In ar, this message translates to:
  /// **'اكتشف الأماكن '**
  String get home_body_text4;

  /// No description provided for @home_body_text5.
  ///
  /// In ar, this message translates to:
  /// **' أقوى العروض '**
  String get home_body_text5;

  /// No description provided for @home_body_text6.
  ///
  /// In ar, this message translates to:
  /// **'خدمات ومنتجات بأسعار مخفضة '**
  String get home_body_text6;

  /// No description provided for @home_body_text7.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم :'**
  String get home_body_text7;

  /// No description provided for @notification_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notification_screen_text1;

  /// No description provided for @notification_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اشعارات حاليا'**
  String get notification_screen_text2;

  /// No description provided for @location_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'الإنتقال إلى تفاصيل التاجر'**
  String get location_screen_text1;

  /// No description provided for @restaurants_cafes_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'المطاعم والكافيهات'**
  String get restaurants_cafes_screen_text1;

  /// No description provided for @restaurants_cafes_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'إبحث عن العروض التي تريدها'**
  String get restaurants_cafes_screen_text2;

  /// No description provided for @restaurants_cafes_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'العروض'**
  String get restaurants_cafes_screen_text3;

  /// No description provided for @restaurants_cafes_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'التجار'**
  String get restaurants_cafes_screen_text4;

  /// No description provided for @restaurants_cafes_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'خدمات/منتجات'**
  String get restaurants_cafes_screen_text5;

  /// No description provided for @restaurants_cafes_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم :'**
  String get restaurants_cafes_screen_text6;

  /// No description provided for @restaurants_cafes_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'عروض خاصة'**
  String get restaurants_cafes_screen_text7;

  /// No description provided for @restaurants_cafes_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'خدمة / منتج'**
  String get restaurants_cafes_screen_text8;

  /// No description provided for @restaurants_cafes_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'فلتر'**
  String get restaurants_cafes_screen_text9;

  /// No description provided for @restaurants_cafes_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'المدينة '**
  String get restaurants_cafes_screen_text10;

  /// No description provided for @restaurants_cafes_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'البلدة'**
  String get restaurants_cafes_screen_text11;

  /// No description provided for @restaurants_cafes_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'بحث'**
  String get restaurants_cafes_screen_text12;

  /// No description provided for @restaurants_cafes_screen_text13.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get restaurants_cafes_screen_text13;

  /// No description provided for @restaurants_cafes_screen_text14.
  ///
  /// In ar, this message translates to:
  /// **'قم بالبحث هنا'**
  String get restaurants_cafes_screen_text14;

  /// No description provided for @restaurants_cafes_screen_text15.
  ///
  /// In ar, this message translates to:
  /// **'أكثر المزودين رواجا'**
  String get restaurants_cafes_screen_text15;

  /// No description provided for @trader_details_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل التاجر '**
  String get trader_details_screen_text1;

  /// No description provided for @trader_details_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **' نسبة الخصم: '**
  String get trader_details_screen_text2;

  /// No description provided for @trader_details_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'موقع التاجر '**
  String get trader_details_screen_text3;

  /// No description provided for @trader_details_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'مواقع التواصل الاجتماعي الخاصة بالتاجر '**
  String get trader_details_screen_text4;

  /// No description provided for @trader_details_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'مواعيد العمل'**
  String get trader_details_screen_text5;

  /// No description provided for @trader_details_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'المنتجات الغير مشمولة في الخصم'**
  String get trader_details_screen_text6;

  /// No description provided for @trader_details_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'نود التنويه إلى أن بعض الخدمات لدينا غير مشمولة ضمن الخصومات'**
  String get trader_details_screen_text7;

  /// No description provided for @trader_details_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'المزود يعتمد على بيع خدمة /منتج '**
  String get trader_details_screen_text8;

  /// No description provided for @trader_details_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'موقع المزود  '**
  String get trader_details_screen_text9;

  /// No description provided for @trader_details_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'مواقع التواصل الاجتماعي الخاصة بالتاجر  '**
  String get trader_details_screen_text10;

  /// No description provided for @trader_details_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'قائمة الخدمات المنتجات '**
  String get trader_details_screen_text11;

  /// No description provided for @trader_details_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'المزود يعتمد على العروض الخاصة فقط  '**
  String get trader_details_screen_text12;

  /// No description provided for @trader_details_screen_text13.
  ///
  /// In ar, this message translates to:
  /// **' قائمة العروض الخاصة  '**
  String get trader_details_screen_text13;

  /// No description provided for @favorites_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get favorites_screen_text1;

  /// No description provided for @favorites_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'المزودين'**
  String get favorites_screen_text2;

  /// No description provided for @favorites_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'العروض'**
  String get favorites_screen_text3;

  /// No description provided for @favorites_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'انتهى العرض'**
  String get favorites_screen_text4;

  /// No description provided for @favorites_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'العرض متاح'**
  String get favorites_screen_text5;

  /// No description provided for @qr_screen_tex1.
  ///
  /// In ar, this message translates to:
  /// **'الماسح الضوئي'**
  String get qr_screen_tex1;

  /// No description provided for @complete_purchase_text1.
  ///
  /// In ar, this message translates to:
  /// **'إتمام عملية الشراء'**
  String get complete_purchase_text1;

  /// No description provided for @complete_purchase_text2.
  ///
  /// In ar, this message translates to:
  /// **'إسم المنتج/ الخدمة'**
  String get complete_purchase_text2;

  /// No description provided for @complete_purchase_text3.
  ///
  /// In ar, this message translates to:
  /// **'عدد القطع'**
  String get complete_purchase_text3;

  /// No description provided for @complete_purchase_text4.
  ///
  /// In ar, this message translates to:
  /// **'توفيراتي من المنتج / الخدمة'**
  String get complete_purchase_text4;

  /// No description provided for @complete_purchase_text5.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ قبل الخصم للمنتج/ الخدمة :'**
  String get complete_purchase_text5;

  /// No description provided for @complete_purchase_text6.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ بعد الخصم للمنتج/ الخدمة :'**
  String get complete_purchase_text6;

  /// No description provided for @complete_purchase_text7.
  ///
  /// In ar, this message translates to:
  /// **' إضافته إلى السلة'**
  String get complete_purchase_text7;

  /// No description provided for @complete_purchase_text8.
  ///
  /// In ar, this message translates to:
  /// **'المنتجات /الخدمات المتاحة في السلة'**
  String get complete_purchase_text8;

  /// No description provided for @complete_purchase_text9.
  ///
  /// In ar, this message translates to:
  /// **'عدد القطع'**
  String get complete_purchase_text9;

  /// No description provided for @complete_purchase_text10.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ قبل الخصم'**
  String get complete_purchase_text10;

  /// No description provided for @complete_purchase_text11.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ بعد الخصم'**
  String get complete_purchase_text11;

  /// No description provided for @complete_purchase_text12.
  ///
  /// In ar, this message translates to:
  /// **'إتمام عملية الشراء'**
  String get complete_purchase_text12;

  /// No description provided for @complete_purchase_text13.
  ///
  /// In ar, this message translates to:
  /// **'قم بدفع المبلغ التالي للمزود '**
  String get complete_purchase_text13;

  /// No description provided for @complete_purchase_text14.
  ///
  /// In ar, this message translates to:
  /// **'مجموع مبلغ قبل الخصم :'**
  String get complete_purchase_text14;

  /// No description provided for @complete_purchase_text15.
  ///
  /// In ar, this message translates to:
  /// **'شيكل '**
  String get complete_purchase_text15;

  /// No description provided for @complete_purchase_text16.
  ///
  /// In ar, this message translates to:
  /// **'توفيراتي من العملية :'**
  String get complete_purchase_text16;

  /// No description provided for @complete_purchase_text17.
  ///
  /// In ar, this message translates to:
  /// **'تاكيد العملية '**
  String get complete_purchase_text17;

  /// No description provided for @complete_purchase_text18.
  ///
  /// In ar, this message translates to:
  /// **'مبلغ عملية الشراء قبل الخصم '**
  String get complete_purchase_text18;

  /// No description provided for @complete_purchase_text19.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم : '**
  String get complete_purchase_text19;

  /// No description provided for @complete_purchase_text20.
  ///
  /// In ar, this message translates to:
  /// **'المنتجات /الخدمات الغير مشمولة في الخصم '**
  String get complete_purchase_text20;

  /// No description provided for @complete_purchase_text21.
  ///
  /// In ar, this message translates to:
  /// **'نود التنويه إلى أن بعض المنتجات / الخدمات لدينا غير مشمولة ضمن الخصومات '**
  String get complete_purchase_text21;

  /// No description provided for @sucess_dialog_in_complete_purchase1.
  ///
  /// In ar, this message translates to:
  /// **'تمت عملية الشراء بنجاح '**
  String get sucess_dialog_in_complete_purchase1;

  /// No description provided for @sucess_dialog_in_complete_purchase2.
  ///
  /// In ar, this message translates to:
  /// **'لقد تمت تاكيد عمليتك من قبل التاجر وتمت عملية الشراء بنجاح'**
  String get sucess_dialog_in_complete_purchase2;

  /// No description provided for @error_dialog_in_complete_purchase1.
  ///
  /// In ar, this message translates to:
  /// **'لم تتم عملية الشراء'**
  String get error_dialog_in_complete_purchase1;

  /// No description provided for @error_dialog_in_complete_purchase2.
  ///
  /// In ar, this message translates to:
  /// **' حدث خطأ أثناء عملية الشراء ولم تتم العملية بنجاح '**
  String get error_dialog_in_complete_purchase2;

  /// No description provided for @my_bills_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'فواتيري'**
  String get my_bills_screen_text1;

  /// No description provided for @my_bills_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'مشترياتي قبل الخصم'**
  String get my_bills_screen_text2;

  /// No description provided for @my_bills_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'مشترياتي بعد الخصم'**
  String get my_bills_screen_text3;

  /// No description provided for @my_bills_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'توفـــــــيــــــراتـي'**
  String get my_bills_screen_text4;

  /// No description provided for @my_bills_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'شيكل'**
  String get my_bills_screen_text5;

  /// No description provided for @my_bills_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'شهر '**
  String get my_bills_screen_text6;

  /// No description provided for @my_bills_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **' 6 شهور'**
  String get my_bills_screen_text7;

  /// No description provided for @my_bills_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'12 شهر'**
  String get my_bills_screen_text8;

  /// No description provided for @my_bills_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'قائمة المشتريات'**
  String get my_bills_screen_text9;

  /// No description provided for @my_bills_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ المخصوم:'**
  String get my_bills_screen_text10;

  /// No description provided for @personal_page_tex1.
  ///
  /// In ar, this message translates to:
  /// **'الصفحة الشخصية '**
  String get personal_page_tex1;

  /// No description provided for @personal_page_tex2.
  ///
  /// In ar, this message translates to:
  /// **'عدد النقاط '**
  String get personal_page_tex2;

  /// No description provided for @personal_page_tex3.
  ///
  /// In ar, this message translates to:
  /// **'نوع الإشتراك '**
  String get personal_page_tex3;

  /// No description provided for @personal_page_tex4.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الإشتراك'**
  String get personal_page_tex4;

  /// No description provided for @setting_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get setting_screen_text1;

  /// No description provided for @setting_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'لغة التطبيق '**
  String get setting_screen_text2;

  /// No description provided for @setting_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'تلقي إشعارات'**
  String get setting_screen_text3;

  /// No description provided for @setting_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'عن التطبيق'**
  String get setting_screen_text4;

  /// No description provided for @setting_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية '**
  String get setting_screen_text5;

  /// No description provided for @setting_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كلمة المرور'**
  String get setting_screen_text6;

  /// No description provided for @setting_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get setting_screen_text7;

  /// No description provided for @setting_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'تعديل اللغة '**
  String get setting_screen_text8;

  /// No description provided for @setting_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'اللغة العربية  '**
  String get setting_screen_text9;

  /// No description provided for @setting_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'English Language '**
  String get setting_screen_text10;

  /// No description provided for @setting_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء  '**
  String get setting_screen_text11;

  /// No description provided for @setting_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'تعديل اللغة  '**
  String get setting_screen_text12;

  /// No description provided for @setting_screen_text13.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج '**
  String get setting_screen_text13;

  /// No description provided for @setting_screen_text14.
  ///
  /// In ar, this message translates to:
  /// **' هل أنت متأكد من عملية تسجيل الخروج؟ '**
  String get setting_screen_text14;

  /// No description provided for @setting_screen_text15.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء  '**
  String get setting_screen_text15;

  /// No description provided for @setting_screen_text16.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج '**
  String get setting_screen_text16;

  /// No description provided for @setting_screen_text17.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل العقد'**
  String get setting_screen_text17;

  /// No description provided for @modify_password_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كلمة المرور'**
  String get modify_password_screen_text1;

  /// No description provided for @modify_password_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'حافظ على أمان حسابك، قم بتحديث كلمة المرور الخاصة بك بانتظام'**
  String get modify_password_screen_text2;

  /// No description provided for @modify_password_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الحالية '**
  String get modify_password_screen_text3;

  /// No description provided for @modify_password_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'********************'**
  String get modify_password_screen_text4;

  /// No description provided for @modify_password_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **' كلمة المرور الجديدة '**
  String get modify_password_screen_text5;

  /// No description provided for @modify_password_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'********************'**
  String get modify_password_screen_text6;

  /// No description provided for @modify_password_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور  الجديدة'**
  String get modify_password_screen_text7;

  /// No description provided for @modify_password_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'********************'**
  String get modify_password_screen_text8;

  /// No description provided for @modify_password_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'تعديل كلمة المرور '**
  String get modify_password_screen_text9;

  /// No description provided for @subscription_details_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الاشتراك'**
  String get subscription_details_screen_text1;

  /// No description provided for @subscription_details_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'معلومات الإشتراك'**
  String get subscription_details_screen_text2;

  /// No description provided for @subscription_details_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'اسم الباقة '**
  String get subscription_details_screen_text3;

  /// No description provided for @subscription_details_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ بداية الاشتراك'**
  String get subscription_details_screen_text4;

  /// No description provided for @subscription_details_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ نهاية الاشتراك'**
  String get subscription_details_screen_text5;

  /// No description provided for @subscription_details_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'حالة الإشتراك'**
  String get subscription_details_screen_text6;

  /// No description provided for @subscription_details_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'الاشتراك نشط'**
  String get subscription_details_screen_text7;

  /// No description provided for @about_application_screen_tex1.
  ///
  /// In ar, this message translates to:
  /// **'عن التطبيق'**
  String get about_application_screen_tex1;

  /// No description provided for @about_application_screen_tex2.
  ///
  /// In ar, this message translates to:
  /// **'تم إطلاق تطبيق شركة /\"واليت ديلز\" لتسهيل عمليات الشراء اليومية وتمكين المستخدمين من معرفة أحدث العروض الحصرية. يتميز التطبيق بتوفره على منصتي Google Play وApp Store، ويدعم كلًا من اللغة العربية والإنجليزية لتلبية احتياجات مختلف المستخدمين. يتيح التطبيق سهولة تسجيل البيانات مع ضمان خصوصية عالية وحماية كاملة أثناء الاستخدام. بالإضافة إلى ذلك، يحتوي التطبيق على Google Maps لتسهيل الوصول إلى مختلف القطاعات، ورمز QR مخصص لكل مشترك لا يمكن مشاركته مع أي شخص آخر، مما يعزز الأمان. يتميز التطبيق أيضًا بسرعة الاستجابة، ووجود متصفح داخلي يتيح للمستخدمين تصفح العروض والمنتجات بسهولة. كما يقدم التطبيق برنامج نقاط مميز للمشتركين، ويقدم دعمًا فنيًا على مدار الساعة، إلى جانب التحديثات المستمرة لضمان تقديم أفضل تجربة استخدام. والعديد من الميزات الأخرى التي تجعل من /\"واليت ديلز\" الخيار الأمثل للتسوق اليومي.'**
  String get about_application_screen_tex2;

  /// No description provided for @privacy_policy_screen_tex1.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية'**
  String get privacy_policy_screen_tex1;

  /// No description provided for @privacy_policy_screen_tex2.
  ///
  /// In ar, this message translates to:
  /// **'1- مقدمة'**
  String get privacy_policy_screen_tex2;

  /// No description provided for @privacy_policy_screen_tex3.
  ///
  /// In ar, this message translates to:
  /// **'2- المعلومات التي نجمعها'**
  String get privacy_policy_screen_tex3;

  /// No description provided for @privacy_policy_screen_tex4.
  ///
  /// In ar, this message translates to:
  /// **'3- كيفية استخدام المعلومات'**
  String get privacy_policy_screen_tex4;

  /// No description provided for @contact_us_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تواصل معنا '**
  String get contact_us_screen_text1;

  /// No description provided for @contact_us_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'الإسم الأول '**
  String get contact_us_screen_text2;

  /// No description provided for @contact_us_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'الإسم الأول'**
  String get contact_us_screen_text3;

  /// No description provided for @contact_us_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'إسم العائلة'**
  String get contact_us_screen_text4;

  /// No description provided for @contact_us_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **' إسم العائلة '**
  String get contact_us_screen_text5;

  /// No description provided for @contact_us_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get contact_us_screen_text6;

  /// No description provided for @contact_us_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني الخاص بك'**
  String get contact_us_screen_text7;

  /// No description provided for @contact_us_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get contact_us_screen_text8;

  /// No description provided for @contact_us_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف  '**
  String get contact_us_screen_text9;

  /// No description provided for @contact_us_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'الرسالة '**
  String get contact_us_screen_text10;

  /// No description provided for @contact_us_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'الرسالة التي تود ارسالها إلى واليت ديلز '**
  String get contact_us_screen_text11;

  /// No description provided for @contact_us_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الرسالة '**
  String get contact_us_screen_text12;

  /// No description provided for @trader_one_home_text1.
  ///
  /// In ar, this message translates to:
  /// **'قسم المزودين'**
  String get trader_one_home_text1;

  /// No description provided for @trader_one_home_text2.
  ///
  /// In ar, this message translates to:
  /// **'صباح الخير'**
  String get trader_one_home_text2;

  /// No description provided for @trader_one_home_text3.
  ///
  /// In ar, this message translates to:
  /// **'مساء الخير'**
  String get trader_one_home_text3;

  /// No description provided for @trader_one_home_text4.
  ///
  /// In ar, this message translates to:
  /// **'أخر تسجيل '**
  String get trader_one_home_text4;

  /// No description provided for @trader_one_home_text5.
  ///
  /// In ar, this message translates to:
  /// **'الإختصارات'**
  String get trader_one_home_text5;

  /// No description provided for @trader_one_home_text6.
  ///
  /// In ar, this message translates to:
  /// **'تعديل على الخصم'**
  String get trader_one_home_text6;

  /// No description provided for @trader_one_home_text7.
  ///
  /// In ar, this message translates to:
  /// **'إرسال طلب'**
  String get trader_one_home_text7;

  /// No description provided for @trader_one_home_text8.
  ///
  /// In ar, this message translates to:
  /// **'إضافة زبون'**
  String get trader_one_home_text8;

  /// No description provided for @trader_one_home_text9.
  ///
  /// In ar, this message translates to:
  /// **'طلبات الزبائن'**
  String get trader_one_home_text9;

  /// No description provided for @trader_one_home_text10.
  ///
  /// In ar, this message translates to:
  /// **'الصفحة الشخصية '**
  String get trader_one_home_text10;

  /// No description provided for @trader_one_edit_discount_text1.
  ///
  /// In ar, this message translates to:
  /// **'تعديل نسبة الخصم'**
  String get trader_one_edit_discount_text1;

  /// No description provided for @trader_one_edit_discount_text2.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم القديمة '**
  String get trader_one_edit_discount_text2;

  /// No description provided for @trader_one_edit_discount_text3.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم القديمة '**
  String get trader_one_edit_discount_text3;

  /// No description provided for @trader_one_edit_discount_text4.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم الجديدة '**
  String get trader_one_edit_discount_text4;

  /// No description provided for @trader_one_edit_discount_text5.
  ///
  /// In ar, this message translates to:
  /// **'نسبة الخصم الجديدة '**
  String get trader_one_edit_discount_text5;

  /// No description provided for @trader_one_edit_discount_text6.
  ///
  /// In ar, this message translates to:
  /// **'إرسال طلب التعديل'**
  String get trader_one_edit_discount_text6;

  /// No description provided for @dialog_in_edit_discount_text1.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الإرسال'**
  String get dialog_in_edit_discount_text1;

  /// No description provided for @dialog_in_edit_discount_text2.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من رغبتك في إرسال تعديل الخصم ؟ '**
  String get dialog_in_edit_discount_text2;

  /// No description provided for @dialog_in_edit_discount_text3.
  ///
  /// In ar, this message translates to:
  /// **'يرجى التأكد من صحة جميع المعلومات قبل الإرسال'**
  String get dialog_in_edit_discount_text3;

  /// No description provided for @dialog_in_edit_discount_text4.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء '**
  String get dialog_in_edit_discount_text4;

  /// No description provided for @dialog_in_edit_discount_text5.
  ///
  /// In ar, this message translates to:
  /// **'إرسال'**
  String get dialog_in_edit_discount_text5;

  /// No description provided for @trader_subscribe_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'اشتـــرك الآن '**
  String get trader_subscribe_screen_text1;

  /// No description provided for @trader_subscribe_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'اختر الخطة التي يفضلها الزبون'**
  String get trader_subscribe_screen_text2;

  /// No description provided for @trader_subscribe_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'اخترالباقة الآن  التي يفضلها الزبون واجعله يستمتع بخصومات حصرية على كل ما يحتاجه مع Wallet Deals!'**
  String get trader_subscribe_screen_text3;

  /// No description provided for @trader_subscribe_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'الخطة الرائجة'**
  String get trader_subscribe_screen_text4;

  /// No description provided for @trader_subscribe_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'مدة الإشتراك'**
  String get trader_subscribe_screen_text5;

  /// No description provided for @trader_subscribe_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'كل شهر '**
  String get trader_subscribe_screen_text6;

  /// No description provided for @trader_subscribe_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'القطاعات المشمولة '**
  String get trader_subscribe_screen_text7;

  /// No description provided for @trader_subscribe_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'الاشتراك في هذه الخطة'**
  String get trader_subscribe_screen_text8;

  /// No description provided for @trader_subscribe_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل إشتراك الزبون'**
  String get trader_subscribe_screen_text9;

  /// No description provided for @trader_detials_subscribe_dialog_text1.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل إشتراك الزبون'**
  String get trader_detials_subscribe_dialog_text1;

  /// No description provided for @trader_detials_subscribe_dialog_text2.
  ///
  /// In ar, this message translates to:
  /// **'أرباحي من العملية :'**
  String get trader_detials_subscribe_dialog_text2;

  /// No description provided for @trader_detials_subscribe_dialog_text3.
  ///
  /// In ar, this message translates to:
  /// **'شيكل'**
  String get trader_detials_subscribe_dialog_text3;

  /// No description provided for @trader_detials_subscribe_dialog_text4.
  ///
  /// In ar, this message translates to:
  /// **'سعر الباقة على التاجر :'**
  String get trader_detials_subscribe_dialog_text4;

  /// No description provided for @customer_requests_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'طلبات الزبائن'**
  String get customer_requests_screen_text1;

  /// No description provided for @customer_requests_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'الغير مؤكدة'**
  String get customer_requests_screen_text2;

  /// No description provided for @customer_requests_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'المكتملة'**
  String get customer_requests_screen_text3;

  /// No description provided for @customer_requests_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد جميع الطلبات'**
  String get customer_requests_screen_text4;

  /// No description provided for @customer_requests_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الطلب'**
  String get customer_requests_screen_text5;

  /// No description provided for @customer_requests_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'مبلغ الفاتورة:'**
  String get customer_requests_screen_text6;

  /// No description provided for @customer_requests_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'شيكل'**
  String get customer_requests_screen_text7;

  /// No description provided for @customer_requests_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ الذي سيدفعه الزبون بعد الخصم'**
  String get customer_requests_screen_text8;

  /// No description provided for @customer_requests_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'المبيعات من خلال شركة واليت ديلز'**
  String get customer_requests_screen_text9;

  /// No description provided for @customer_requests_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'شيكل'**
  String get customer_requests_screen_text10;

  /// No description provided for @customer_requests_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'شهر'**
  String get customer_requests_screen_text11;

  /// No description provided for @customer_requests_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'6 شهور'**
  String get customer_requests_screen_text12;

  /// No description provided for @customer_requests_screen_text13.
  ///
  /// In ar, this message translates to:
  /// **'12 شهر'**
  String get customer_requests_screen_text13;

  /// No description provided for @customer_requests_screen_text14.
  ///
  /// In ar, this message translates to:
  /// **'قائمة المبيعات '**
  String get customer_requests_screen_text14;

  /// No description provided for @customer_requests_screen_text15.
  ///
  /// In ar, this message translates to:
  /// **'تم البيع'**
  String get customer_requests_screen_text15;

  /// No description provided for @confirmation_all_dialog_text1.
  ///
  /// In ar, this message translates to:
  /// **'تاكيد جميع الطلبات'**
  String get confirmation_all_dialog_text1;

  /// No description provided for @confirmation_all_dialog_text2.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من تاكيد جميع طلبات الزبائن؟'**
  String get confirmation_all_dialog_text2;

  /// No description provided for @confirmation_all_dialog_text3.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء '**
  String get confirmation_all_dialog_text3;

  /// No description provided for @confirmation_all_dialog_text4.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد'**
  String get confirmation_all_dialog_text4;

  /// No description provided for @confirmation_order_text1.
  ///
  /// In ar, this message translates to:
  /// **'تاكيد الطلب'**
  String get confirmation_order_text1;

  /// No description provided for @confirmation_order_text2.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من تاكيد الطلب الخاص بالزبون ؟'**
  String get confirmation_order_text2;

  /// No description provided for @confirmation_order_text3.
  ///
  /// In ar, this message translates to:
  /// **'اسم الزبون :'**
  String get confirmation_order_text3;

  /// No description provided for @confirmation_order_text4.
  ///
  /// In ar, this message translates to:
  /// **'مبلغ الفاتورة :'**
  String get confirmation_order_text4;

  /// No description provided for @confirmation_order_text5.
  ///
  /// In ar, this message translates to:
  /// **'مبلغ الفاتورة بعد الخصم :'**
  String get confirmation_order_text5;

  /// No description provided for @confirmation_order_text6.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء '**
  String get confirmation_order_text6;

  /// No description provided for @confirmation_order_text7.
  ///
  /// In ar, this message translates to:
  /// **'قبول العملية'**
  String get confirmation_order_text7;

  /// No description provided for @edit_acount_info_screen_text1.
  ///
  /// In ar, this message translates to:
  /// **'تعديل معلومات الحساب'**
  String get edit_acount_info_screen_text1;

  /// No description provided for @edit_acount_info_screen_text2.
  ///
  /// In ar, this message translates to:
  /// **'الإسم الأول المزود'**
  String get edit_acount_info_screen_text2;

  /// No description provided for @edit_acount_info_screen_text3.
  ///
  /// In ar, this message translates to:
  /// **'الإسم الأول'**
  String get edit_acount_info_screen_text3;

  /// No description provided for @edit_acount_info_screen_text4.
  ///
  /// In ar, this message translates to:
  /// **'الإسم الثاني المزود'**
  String get edit_acount_info_screen_text4;

  /// No description provided for @edit_acount_info_screen_text5.
  ///
  /// In ar, this message translates to:
  /// **'إسم العائلة'**
  String get edit_acount_info_screen_text5;

  /// No description provided for @edit_acount_info_screen_text6.
  ///
  /// In ar, this message translates to:
  /// **'اسم المنشاة التجارية'**
  String get edit_acount_info_screen_text6;

  /// No description provided for @edit_acount_info_screen_text7.
  ///
  /// In ar, this message translates to:
  /// **'قم بكتابة اسم المنشاة التجارية '**
  String get edit_acount_info_screen_text7;

  /// No description provided for @edit_acount_info_screen_text8.
  ///
  /// In ar, this message translates to:
  /// **'الوصف الفرعي'**
  String get edit_acount_info_screen_text8;

  /// No description provided for @edit_acount_info_screen_text9.
  ///
  /// In ar, this message translates to:
  /// **'الوصف الفرعي  الذي سيظهر للزبائن لا يزيد عن 80 حرف'**
  String get edit_acount_info_screen_text9;

  /// No description provided for @edit_acount_info_screen_text10.
  ///
  /// In ar, this message translates to:
  /// **'المدينة'**
  String get edit_acount_info_screen_text10;

  /// No description provided for @edit_acount_info_screen_text11.
  ///
  /// In ar, this message translates to:
  /// **'البلدة'**
  String get edit_acount_info_screen_text11;

  /// No description provided for @edit_acount_info_screen_text12.
  ///
  /// In ar, this message translates to:
  /// **'إضافة الموقع'**
  String get edit_acount_info_screen_text12;

  /// No description provided for @edit_acount_info_screen_text13.
  ///
  /// In ar, this message translates to:
  /// **'قائمة المواقع (الفروع)'**
  String get edit_acount_info_screen_text13;

  /// No description provided for @edit_acount_info_screen_text14.
  ///
  /// In ar, this message translates to:
  /// **'المدينة'**
  String get edit_acount_info_screen_text14;

  /// No description provided for @edit_acount_info_screen_text15.
  ///
  /// In ar, this message translates to:
  /// **'البلدة'**
  String get edit_acount_info_screen_text15;

  /// No description provided for @edit_acount_info_screen_text16.
  ///
  /// In ar, this message translates to:
  /// **'رابط صفحة الفيسبوك'**
  String get edit_acount_info_screen_text16;

  /// No description provided for @edit_acount_info_screen_text17.
  ///
  /// In ar, this message translates to:
  /// **'رابط الصفحة'**
  String get edit_acount_info_screen_text17;

  /// No description provided for @edit_acount_info_screen_text18.
  ///
  /// In ar, this message translates to:
  /// **'رابط صفحة الإنستقرام'**
  String get edit_acount_info_screen_text18;

  /// No description provided for @edit_acount_info_screen_text19.
  ///
  /// In ar, this message translates to:
  /// **'رابط صفحة  الإنستقرام'**
  String get edit_acount_info_screen_text19;

  /// No description provided for @edit_acount_info_screen_text20.
  ///
  /// In ar, this message translates to:
  /// **'رقم الواتساب'**
  String get edit_acount_info_screen_text20;

  /// No description provided for @edit_acount_info_screen_text21.
  ///
  /// In ar, this message translates to:
  /// **'رابط رقم الواتس أب'**
  String get edit_acount_info_screen_text21;

  /// No description provided for @edit_acount_info_screen_text22.
  ///
  /// In ar, this message translates to:
  /// **'رابط صفحة التيكتوك'**
  String get edit_acount_info_screen_text22;

  /// No description provided for @edit_acount_info_screen_text23.
  ///
  /// In ar, this message translates to:
  /// **'رابط صفحة التيك توك'**
  String get edit_acount_info_screen_text23;

  /// No description provided for @edit_acount_info_screen_text24.
  ///
  /// In ar, this message translates to:
  /// **'مواعيد العمل '**
  String get edit_acount_info_screen_text24;

  /// No description provided for @edit_acount_info_screen_text25.
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get edit_acount_info_screen_text25;

  /// No description provided for @edit_acount_info_screen_text26.
  ///
  /// In ar, this message translates to:
  /// **'إلى'**
  String get edit_acount_info_screen_text26;

  /// No description provided for @edit_acount_info_screen_text27.
  ///
  /// In ar, this message translates to:
  /// **'أيام العمل'**
  String get edit_acount_info_screen_text27;

  /// No description provided for @edit_acount_info_screen_text28.
  ///
  /// In ar, this message translates to:
  /// **'السبت'**
  String get edit_acount_info_screen_text28;

  /// No description provided for @edit_acount_info_screen_text29.
  ///
  /// In ar, this message translates to:
  /// **'الأحد'**
  String get edit_acount_info_screen_text29;

  /// No description provided for @edit_acount_info_screen_text30.
  ///
  /// In ar, this message translates to:
  /// **'الإثنين'**
  String get edit_acount_info_screen_text30;

  /// No description provided for @edit_acount_info_screen_text31.
  ///
  /// In ar, this message translates to:
  /// **'الثلاثاء'**
  String get edit_acount_info_screen_text31;

  /// No description provided for @edit_acount_info_screen_text32.
  ///
  /// In ar, this message translates to:
  /// **'الأربعاء'**
  String get edit_acount_info_screen_text32;

  /// No description provided for @edit_acount_info_screen_text33.
  ///
  /// In ar, this message translates to:
  /// **'الخميس'**
  String get edit_acount_info_screen_text33;

  /// No description provided for @edit_acount_info_screen_text34.
  ///
  /// In ar, this message translates to:
  /// **'تعديل اللوجو'**
  String get edit_acount_info_screen_text34;

  /// No description provided for @edit_acount_info_screen_text35.
  ///
  /// In ar, this message translates to:
  /// **'تعديل اللوجو'**
  String get edit_acount_info_screen_text35;

  /// No description provided for @edit_acount_info_screen_text36.
  ///
  /// In ar, this message translates to:
  /// **'تعديل البيانات'**
  String get edit_acount_info_screen_text36;

  /// No description provided for @error_internet_connection_title.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اتصال بالإنترنت'**
  String get error_internet_connection_title;

  /// No description provided for @error_internet_connection_subTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحقق من اتصالك بالشبكة وحاول مرة أخرى'**
  String get error_internet_connection_subTitle;

  /// No description provided for @error_internet_connection_buttonText.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get error_internet_connection_buttonText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

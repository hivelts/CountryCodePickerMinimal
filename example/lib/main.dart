import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker_minimal/country_code_picker_minimal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: const [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: const [
        CountryLocalizationsMinimal.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CountryPickerMinimal Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CountryCodePickerMinimal(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'MX',
                onInit: (code) => debugPrint("on init ${code?.name} ${code?.dialCode} ${code?.name}"),
              ),
              CountryCodePickerMinimal(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: const ['+39', 'FR'],
                countryFilter: const ['IT', 'FR', 'MX', 'BO'],
                // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                flagDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                fullDialog: false,
                searchItemsDirection: TextDirection.rtl,
              ),
              const SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePickerMinimal(
                  onChanged: print,
                  hideMainText: true,
                  showFlagMain: true,
                  showFlag: false,
                  initialSelection: 'MX',
                  hideSearch: true,
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  alignLeft: true,
                  fullDialog: false,
                  searchItemsDirection: TextDirection.rtl,
                  dialogBorderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePickerMinimal(
                  onChanged: (element) => debugPrint(element.toLongString()),
                  initialSelection: 'BO',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: const ['+39', 'FR'],
                  fullDialog: false,
                  barrierColor: Colors.green.withOpacity(0.5),
                  dialogBorderRadius: const BorderRadius.all(Radius.circular(12)),
                  searchItemsDirection: TextDirection.rtl,
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.green),
                  dialogTextStyle: const TextStyle(color: Colors.white),
                  searchDecoration: const InputDecoration(
                    border: InputBorder.none, // Remove the border
                    hintText: 'Enter country name',
                    hintStyle: TextStyle(color: Colors.amberAccent),
                  ),
                  searchStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

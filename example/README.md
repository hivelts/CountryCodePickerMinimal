# country_code_picker_minimal

A flutter package to display a country code selector, in dialog or full screen, customizable.

It supports i18n for 70 languages.

Check the example on web! https://hivelts.dev/CountryCodePickerMinimal

<img src="https://raw.githubusercontent.com/hivelts/CountryCodePickerMinimal/master/screenshots/screenshots1.png" width="240"/>
<img src="https://raw.githubusercontent.com/hivelts/CountryCodePickerMinimal/master/screenshots/screenshots2.png" width="240"/>
<img src="https://raw.githubusercontent.com/hivelts/CountryCodePickerMinimal/master/screenshots/screenshots3.png" width="240"/>
<img src="https://raw.githubusercontent.com/hivelts/CountryCodePickerMinimal/master/screenshots/screenshots4.png" width="240"/>

## Usage

Just put the component in your application setting the onChanged callback.

```dart

@override
 Widget build(BuildContext context) => new Scaffold(
     body: Center(
       child: CountryCodePickerMinimal(
         onChanged: (CountryCode countryCode) {
           //TODO : manipulate the selected country code here
           print("New Country selected: " + countryCode.toString());
         },
         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
         initialSelection: 'MX',
         onInit: (code) => debugPrint("on init ${code?.name} ${code?.dialCode} ${code?.name}"),
       ),
     ),
 );

```

Custom Example:

```dart

CountryCodePickerMinimal(
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

```

### i18n

Just add the `CountryLocalizations.delegate` in the list of your app delegates

```dart
 return new MaterialApp(
      supportedLocales: [
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
      localizationsDelegates: [
        CountryLocalizationsMinimal.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
```

## Contributions

Contributions of any kind are more than welcome! Feel free to fork and improve country_code_picker_minimal in any way you want, make a pull request, or open an issue.


## Getting involved
First of all, thank you for even considering to get involved. You are a real super :star:  and we :heart:  you!

### Reporting bugs and issues
Use the configured [Github issue report template](https://github.com/hivelts/CountryCodePickerMinimal/issues/new?assignees=&labels=&template=bug_report.md&title=) when reporting an issue. Make sure to state your observations and expectations
as objectively and informative as possible so that we can understand your need and be able to troubleshoot.

### Discussions and ideas
We're happy to discuss and talk about ideas, post your
question to [StackOverflow](https://stackoverflow.com/search?q=country+code+picker+minimal).






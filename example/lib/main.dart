import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'US'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'GB'),
        Locale('en', 'US'),
        Locale('ar'),
        Locale('zh'),
      ],
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDatePickerDialog(
                          backgroundColor: Colors.white,
                          selectedCellDecoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          currentDateDecoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                          // disabledCellsDecoration:
                          //     const BoxDecoration(color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                          // enabledCellsDecoration: const BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
                          enabledCellsTextStyle: const TextStyle(),
                          disabledCellsTextStyle: const TextStyle(),
                          splashColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          minDate: DateTime(2003, 05, 10),
                          maxDate: DateTime(2024, 10, 30),
                          centerLeadingDate: true,
                        );
                      },
                      child: const Text('Dialog'),
                    ),
                    TextButton(
                      onPressed: () {
                        showRangePickerDialog(
                          backgroundColor: Colors.white,
                          selectedCellsDecoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          currentDateDecoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                          // disabledCellsDecoration:
                          //     const BoxDecoration(color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                          // enabledCellsDecoration: const BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
                          enabledCellsTextStyle: const TextStyle(),
                          disabledCellsTextStyle: const TextStyle(),
                          splashColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          minDate: DateTime(2020, 10, 10),
                          maxDate: DateTime(2024, 10, 30),
                          centerLeadingDate: true,
                        );
                      },
                      child: const Text('Rang Dialog'),
                    ),
                    RangeDatePicker(
                      centerLeadingDate: true,
                      minDate: DateTime(2020, 10, 10),
                      maxDate: DateTime(2024, 10, 30),
                    ),
                    DatePicker(
                      centerLeadingDate: true,
                      minDate: DateTime(2020, 10, 10),
                      maxDate: DateTime(2024, 10, 30),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

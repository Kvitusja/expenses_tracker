import 'package:expenses_tracker/widgets/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(fontFamily: 'Quicksand',
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,),
        ),
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(titleTextStyle:
        TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.black87,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
      home: const MainScreenWidget(),
    );
  }
}

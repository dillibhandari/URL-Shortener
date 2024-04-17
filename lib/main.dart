import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils.dart/app_colors.dart';
import 'package:url_shorter/global/start_app_widget.dart';
import 'package:url_shorter/global/dependency_injection.dart' as di;
import 'package:url_shorter/feature/url_generator/presentation/view/short_url_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StartAppWidget(
      child: MaterialApp(
        title: 'Url shorter app',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: false),
        home: const ShortUrlPage(),
      ),
    );
  }
}

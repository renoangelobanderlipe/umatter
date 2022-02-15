import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umatter/controllers/dashboard_controller/dashboard_binding.dart';
import 'package:umatter/views/authentication_page/login.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/meditate/meditate.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';
import 'package:umatter/views/home_page/my_mood/my_mood.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';
import 'package:umatter/views/onboarding_screen/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isViewed = sharedPreferences.getInt("onboarding");
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Onboarding Screen Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: const Color(0xff8cbbf1),
        // primarySwatch: Colors.orange.shade200,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          // This automatically load the homepage or the first index in the our navigation bar
          name: '/',
          // This will check if the user has already visited the app before if not the app will be loaded with OnboardingPage otherwise it will load the HomePage.
          page: () => isViewed != 0 ? OnboardingPage() : const LoginPage(),
          binding: DashBoardBinding(),
        ),
        GetPage(
          name: '/discover',
          page: () => const DiscoverPage(),
        ),
        GetPage(
          name: '/my_mood',
          page: () => const MyMoodPage(),
        ),
        GetPage(
          name: '/meditate',
          page: () => const MeditatePage(),
        ),
        GetPage(
          name: '/my_diary',
          page: () => const MyDiaryPage(),
        ),
        GetPage(
          name: '/counselor',
          page: () => const ProfessionalDirectoriesPage(),
        ),
      ],
    );
  }
}

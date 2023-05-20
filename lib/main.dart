import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/auth/auth_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/utils.dart';
import 'screens/auth/verify_email_screen.dart';
import 'screens/drawer_screens/about_us_screen.dart';
import 'screens/drawer_screens/contact_us_screen.dart';
import 'screens/drawer_screens/faq_screen.dart';
import 'screens/drawer_screens/policies_screen.dart';
import 'screens/drawer_screens/profile_screen.dart';
import 'screens/gardens/garden_detail_screen.dart';
import 'screens/gardens/garden_map_view.dart';
import 'screens/gardens/garden_space_screen.dart';
import 'screens/libraryScreens/library_detail_screen.dart';
import 'screens/libraryScreens/library_map_view.dart';
import 'screens/libraryScreens/library_space_screen.dart';
import 'screens/main_grid_screen.dart';
import 'screens/playground/playground_detail_screen.dart';
import 'screens/playground/playground_map_view.dart';
import 'screens/playground/playground_space_screen.dart';
import 'screens/recreation/recreation_detail_screen.dart';
import 'screens/recreation/recreation_map_view.dart';
import 'screens/recreation/recreation_space_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/swimming/swimming_detail_screen.dart';
import 'screens/swimming/swimming_map_view.dart';
import 'screens/swimming/swimming_space_screen.dart';
import 'screens/venues/venue_detail_screen.dart';
import 'screens/venues/venue_map_view.dart';
import 'screens/venues/venue_space_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Urban Data Design',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Calibri',
        backgroundColor: Colors.green.shade800,
      ),
      home: SplashScreen(
        nextScreen: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Urban Data Design'),
                ),
                body: const Center(
                  child: Text('Something Went Wrong'),
                ),
              );
            } else if (snapshot.hasData) {
              return const VerifyEmailScreen();
            } else {
              return const AuthScreen();
            }
          },
        ),
      ),
      routes: {
        //SplashScreen.routeName: (context) => SplashScreen(),
        MainGridScreen.routeName: (context) => MainGridScreen(),
        PlaygroundSpaceScreen.routeName: (context) => PlaygroundSpaceScreen(
              cardText: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
        SwimmingSpaceScreen.routeName: (context) => SwimmingSpaceScreen(
              cardText: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
        GardenSpaceScreen.routeName: (context) => GardenSpaceScreen(
              cardText: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
        LibrarySpaceScreen.routeName: (context) => LibrarySpaceScreen(
              cardText: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
        VenueSpaceScreen.routeName: (context) => VenueSpaceScreen(
              cardText: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
        RecreationSpaceScreen.routeName: (context) => RecreationSpaceScreen(
              cardText: ModalRoute.of(context)!.settings.arguments.toString(),
            ),
        PlaygroundMapView.routeName: (context) => const PlaygroundMapView(),
        SwimmingMapView.routeName: (context) => const SwimmingMapView(),
        GardenMapView.routeName: (context) => const GardenMapView(),
        // ignore: equal_keys_in_map
        LibraryMapView.routeName: (context) => const LibraryMapView(),
        VenueMapView.routeName: (context) => const VenueMapView(),
        RecreationMapView.routeName: (context) => const RecreationMapView(),
        PlaygroundDetailScreen.routeName: (context) => PlaygroundDetailScreen(),
        SwimmingDetailScreen.routeName: (context) => SwimmingDetailScreen(),
        GardenDetailScreen.routeName: (context) => GardenDetailScreen(),
        LibraryDetailScreen.routeName: (context) => LibraryDetailScreen(),
        VenueDetailScreen.routeName: (context) => VenueDetailScreen(),
        RecreationDetailScreen.routeName: (context) => RecreationDetailScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        AboutUsScreen.routeName: (context) => AboutUsScreen(),
        ContactUsScreen.routeName: (context) => const ContactUsScreen(),
        PoliciesScreen.routeName: (context) => const PoliciesScreen(),
        FaqScreen.routeName: (context) => const FaqScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
      },
    );
  }
}

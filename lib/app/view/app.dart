import 'package:flutter/material.dart';
import 'package:flutter_dev_camp_london/home/view/home_page.dart';
import 'package:flutter_dev_camp_london/l10n/l10n.dart';
import 'package:flutter_json_serializable/flutter_json_serializable.dart';
import 'package:flutter_to_do/flutter_to_do.dart';
import 'package:flutter_ui_plants/flutter_ui_plants.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final _routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),

    // User Interface Plants
    GoRoute(
      name: 'plants',
      path: '/plants',
      builder: (context, state) => const HomePagePlants(),
    ),
    GoRoute(
      name: 'details',
      path: '/details',
      builder: (context, state) => const DetailsPagePlants(),
    ), 

    // TO-DO
    GoRoute(
      name: 'toDo',
      path: '/toDo',
      builder: (context, state) => ChangeNotifierProvider(
          create: (BuildContext context) => ToDoViewModel(),
          child: const HomePageToDo(),
        ),
    ),

    // JSON_Serializable
    GoRoute(
      name: 'jsonS',
      path: '/jsonS',
      builder: (context, state) => HomePageJsonSerializable(),
    ),     
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

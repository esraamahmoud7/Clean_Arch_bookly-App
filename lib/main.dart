import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'constants.dart';
import 'core/utils/AppRouters.dart';

void main() async{
  runApp(const Bookly());
  Hive.registerAdapter(BookEntityAdapter());
  
  await Hive.openBox(KFeaturedBox);
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:AppRouter.router ,
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}



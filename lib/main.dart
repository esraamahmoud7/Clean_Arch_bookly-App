import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/featured%20cubit/featured_books_cubit.dart';
import 'package:clean_arc_bokkly_app/Features/Home/Presentation/manager/newest%20cubit/newest_cubit.dart';
import 'package:clean_arc_bokkly_app/Features/Home/data/Repos/HomeReopImp.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/Entities/BookEntity.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/usecases/fetch_Featured_Books_usecase.dart';
import 'package:clean_arc_bokkly_app/Features/Home/domain/usecases/fetech_newest_Books_usecase.dart';
import 'package:clean_arc_bokkly_app/core/utils/simpleBlocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants.dart';
import 'core/utils/AppRouters.dart';
import 'core/utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setUpServiceLocator();
  await Hive.openBox<BookEntity>(KFeaturedBox);
  await Hive.openBox<BookEntity>(KNewestBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(
                    FetchFeaturedBooksUseCase(
                        getIt.get<HomeRepoImp>()
                    )
                )..fetchFeaturedBooks()
        ),
        BlocProvider(
            create: (context) =>
                NewestCubit(
                    FetchNewestBooksUseCase(
                        getIt.get<HomeRepoImp>()
                    )
                )..fetchNewestBooks()
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData
              .dark()
              .textTheme),
        ),
      ),
    );
  }
}



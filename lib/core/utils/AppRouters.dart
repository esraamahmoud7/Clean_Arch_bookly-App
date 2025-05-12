import 'package:clean_arc_bokkly_app/Features/Search/presenation/views/search_view.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Home/Presentation/views/HomeView.dart';
import '../../Features/Home/Presentation/views/widgets/CustomScrollBookDetailsView.dart';
import '../../Features/Home/Presentation/views/widgets/bookDetails_view_body.dart';
import '../../Features/Home/Presentation/views/widgets/book_details_view.dart';
import '../../Features/Splash/Presentation/views/Splash_View.dart';



abstract class AppRouter
{
  static const KHome='/homeView';
  static const KBookDetails='/BookDetails';
  static const KSearch='/search';

  static final router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const SplachView(),
        ),
        GoRoute(
          path: KHome,
          builder: (context, state) => const Homeview(),
        ),
        GoRoute(
          path: KSearch,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: KBookDetails,
          builder: (context, state) => const customScrollBookDetailView(),
        )
      ]
  );
}

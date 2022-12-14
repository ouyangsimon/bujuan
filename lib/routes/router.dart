import 'package:auto_route/auto_route.dart';
import 'package:bujuan/pages/home/first/first_view.dart';
import 'package:bujuan/pages/home/home_mobile_view.dart';
import 'package:bujuan/pages/index/album_view.dart';
import 'package:bujuan/pages/index/main_view.dart';
import 'package:bujuan/pages/login/login.dart';
import 'package:bujuan/pages/play_list/playlist.dart';
import 'package:bujuan/pages/splash_page.dart';
import 'package:bujuan/pages/user/user_view.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const index = _Paths.index;
  static const user = _Paths.user;
  static const details = _Paths.details;
  static const splash = _Paths.splash;
  static const setting = _Paths.setting;
  static const playlist = _Paths.playlist;
  static const login = _Paths.login;
  static const search = _Paths.search;
}

abstract class _Paths {
  _Paths._();

  static const home = '/home';
  static const index = 'index';
  static const user = 'user';
  static const search = 'search';
  static const playlist = 'playlist';
  static const details = '/details';
  static const setting = '/setting';
  static const splash = '/splash';
  static const login = '/login';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: Routes.home, page: FirstView, deferredLoading: true, initial: true, children: [
      AutoRoute(path: Routes.user, page: UserView, initial: true, deferredLoading: true),
      AutoRoute(path: Routes.search, page: AlbumView),
      AutoRoute(path: Routes.playlist, page: PlayList),
      AutoRoute(path: Routes.index, page: MainView)
    ]),
    AutoRoute(path: Routes.login, page: LoginView),
  ],
)
class $RootRouter {}
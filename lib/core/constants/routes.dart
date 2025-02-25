import 'package:flutter/material.dart';
import 'package:varanasi_guide/ui/screens/description/place_details.dart';
import 'package:varanasi_guide/ui/screens/guideList/ghat_list_page.dart';
import 'package:varanasi_guide/ui/screens/main_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const MainPage(),
      '/mainPage': (context) => const MainPage(),
      '/ghat': (context) => GhatListPage(),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name?.startsWith('/placeDetails/') == true) {
      final ghatName = Uri.decodeComponent(settings.name!.split('/').last);
      return MaterialPageRoute(
        builder: (context) => PlaceDetails(ghatName: ghatName),
      );
    }
    return null;
  }
}

import 'package:english_app/components/app_scroll_behavior.dart';
import 'package:english_app/components/init_widget.dart';
import 'package:english_app/routes/mobile_app_router.dart';
import 'package:english_app/server/service_locator.dart' as di;
import 'package:english_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

final appRouter = MobileAppRouter();

void main() async {
  await di.init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(
        builder: (context) => MaterialApp.router(
          theme: darkTheme,
          scrollBehavior: AppScrollBehavior(),
          title: 'English App',
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          routeInformationProvider: appRouter.routeInfoProvider(),
        ),
      ),
    );
  }
  
}

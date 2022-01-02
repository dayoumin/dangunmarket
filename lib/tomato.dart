import 'package:beamer/beamer.dart';
import 'package:dangunmarket/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'router/locations.dart';



final _routerDelegate = BeamerDelegate(
    guards: [BeamGuard(pathPatterns: ['/'], check: (context, location){
              return false;},
              // 윗 부분에서 체크 후 return false => showPage() 이동
              //                  return ture  => HomeLocation()
            showPage: BeamPage(child: AuthScreen()))],

    locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()] ));

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(), 
      routerDelegate: _routerDelegate,
    );
  }
}

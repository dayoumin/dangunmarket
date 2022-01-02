
import 'package:dangunmarket/screens/splashscreen.dart';
import 'package:dangunmarket/tomato.dart';
import 'package:flutter/material.dart';
import 'package:dangunmarket/utils/logger.dart';

void main() {
  logger.d("My first by logger!");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () => 300),
        // 에러 발생시키려면 Duration(seconds: 3), () => throw('error!'),
        // 3초 지연 명령 후 1) 에러, 2) 정상작동, 3) 3초 대기 동안 splashscreen 보여줌
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            /// future 반환값에 따라 child가 바뀔때마다 알아서 애니메이션을 넣어줌
              duration:Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print("error occur while.. ");
      return Text("Error Occur");
    } else if (snapshot.hasData) {
      print('${snapshot.data}');
      return TomatoApp();
    } else {
      print('${snapshot.data}');
      return SplashScreen();
    }
  }
}

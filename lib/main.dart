import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/pages/auth_page.dart';
import 'package:untitled/services/notice.dart';
import 'firebase_options.dart';
import 'package:untitled/pages/registration.dart';
import 'package:untitled/pages/menu.dart';
import 'package:untitled/pages/lists_items.dart';
import 'package:untitled/pages/profile.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAPI().initNotification();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPage(),
        '/reg': (context) => Reg(),
        '/menu': (context) => Menu(),
        '/hab': (context) => ListHabits(),
        '/prof': (context) => Profile1(),

      },
    )
  );
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Настройка анимации вращения
    _controller = AnimationController(
      duration: Duration(seconds: 2),  // Продолжительность анимации
      vsync: this,
    );

    // Создание анимации вращения
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,  // Линейное вращение
    ));

    // Запуск анимации
    _controller.repeat();  // Повторять вращение бесконечно

    // Переход на основной экран через 3 секунды
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/reg');
    });
  }

  @override
  void dispose() {
    _controller.dispose();  // Освобождение ресурсов
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          child: Image.asset('assets/bread-2.png'),
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * 6.3,  // 2π (360 градусов) - полный оборот
              child: child,
            );
          },
        ),
      ),
    );
  }
}
part of 'splash_module.dart';

class MySplashScreen extends StatefulWidget {

  @override
  State<MySplashScreen> createState() {
    return _SplashState();
  }

}

class _SplashState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}

import 'package:construction/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const Initialscreen());
}

class Initialscreen extends StatefulWidget {
  const Initialscreen() : super();

  @override
  State<Initialscreen> createState() => _InitialscreenState();
}

class _InitialscreenState extends State<Initialscreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
    );
    return const MaterialApp(
      home: loginscreen(),
      title: "Construction",
      debugShowCheckedModeBanner: false,
    );
  }
}

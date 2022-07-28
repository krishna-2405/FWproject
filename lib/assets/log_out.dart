import 'package:construction/pages/login_screen.dart';
import 'package:flutter/material.dart';



class logout extends StatelessWidget {
  const logout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const loginscreen(),
            ),
          );
        },
        child: const Icon(
          Icons.logout,
          size: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
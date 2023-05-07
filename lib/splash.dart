// import 'package:calculator_app/main.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const Calculator()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//             child: Text(
//           "Calculator",
//           style: GoogleFonts.sacramento(
//               textStyle: TextStyle(fontSize: 25, color: Colors.white)),
//         )),
//       ),
//     );
//   }
// }

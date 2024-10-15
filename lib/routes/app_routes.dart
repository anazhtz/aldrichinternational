// import 'package:flutter/material.dart';


// class AppRoutes {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return _buildPageRoute(
//           builder: (context) => const LoginPage(),
//           settings: settings,
//         );
//       case '/registerpage':
//         return _buildPageRoute(
//           builder: (context) => const CreateAccountPage(),
//           settings: settings,
//         );
//       case '/homepage':
//         return _buildPageRoute(
//           builder: (context) => const Homepage(),
//           settings: settings,
//         );
//       default:
//         return _buildPageRoute(
//           builder: (context) => const LoginPage(), 
//           settings: settings,
//         );
//     }
//   }

//   static PageRouteBuilder _buildPageRoute({
//     required WidgetBuilder builder,
//     required RouteSettings settings,
//   }) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => builder(context),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: animation,
//           child: child,
//         );
//       },
//       settings: settings,
//     );
//   }
// }
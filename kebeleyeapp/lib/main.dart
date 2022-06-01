import 'package:flutter/material.dart';
import 'package:kebeleyeapp/pages/Admin%20Pages/AccountsTobeVerified.dart';
import 'package:kebeleyeapp/pages/Admin%20Pages/VerifiedAccounts.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/members_edit_account_page.dart';
import 'package:kebeleyeapp/pages/members_home_page.dart';
import 'package:kebeleyeapp/pages/mystate.dart';
import 'package:kebeleyeapp/pages/officialshomepage.dart';
import 'package:kebeleyeapp/pages/recieved_response.dart';
import 'package:kebeleyeapp/pages/sent_feedback_Screen.dart';
import 'package:kebeleyeapp/pages/sent_report_screen.dart';
import 'package:kebeleyeapp/pages/settings.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Login design',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 96, 95, 235)),
        
        
        primarySwatch: Colors.blue,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            MembersHomePage(),
      ),
      GoRoute(
        path: '/loginofficials',
        builder: (BuildContext context, GoRouterState state) => LoginOfficial(),
      ),
      GoRoute(
        path: '/loginpage',
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
      ),
      GoRoute(
        path: '/OfficialsHomePage',
        builder: (BuildContext context, GoRouterState state) =>
            OfficialsHomePage(),
      ),
      GoRoute(
        path: '/sentresponsescreen',
        builder: (BuildContext context, GoRouterState state) =>
            SentReportScreen(),
      ),
      GoRoute(
        path: '/sentfeedbackscreen',
        builder: (BuildContext context, GoRouterState state) =>
            SentFeedbackScreen(),
      ),
      GoRoute(
        path: '/responsescreen',
        builder: (BuildContext context, GoRouterState state) =>
            ResponseScreen(),
      ),
      GoRoute(
        path: '/responsescreen',
        builder: (BuildContext context, GoRouterState state) =>
            MembersEditAccountScreen(),
      ),
      GoRoute(
        path: '/setting',
        builder: (BuildContext context, GoRouterState state) => setting(
          colindex: 1,
        ),
      ),
      GoRoute(
        path: '/accoountstobeverified',
        builder: (BuildContext context, GoRouterState state) =>
            AccountsToBeVerified(),
      ),
      GoRoute(
        path: '/verifiedaccount',
        builder: (BuildContext context, GoRouterState state) =>
            VerifiedAccounts(),
      ),
    ],
  );
}

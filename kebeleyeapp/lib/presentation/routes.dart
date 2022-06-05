import 'package:flutter/material.dart';
import 'package:kebeleyeapp/presentation/posts_list/sent_feedback_Screen.dart';
import 'package:kebeleyeapp/presentation/posts_list/sent_report_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';

import '../presentation/Admin Pages/AccountsTobeVerified.dart';
import '../presentation/Admin Pages/VerifiedAccounts.dart';
import '../presentation/edits/members_edit_account_page.dart';
import 'auth/loginofficials.dart';
import 'auth/loginpage.dart';
import 'core/members_home_page.dart';
import 'core/officialshomepage.dart';
import 'edits/official_edit_.dart';

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
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
      ),
      GoRoute(
        path: '/membershomepage',
        builder: (BuildContext context, GoRouterState state) =>
            MembersHomePage(),
      ),
      GoRoute(
        path: '/loginofficials',
        builder: (BuildContext context, GoRouterState state) => LoginOfficial(),
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
        path: '/memberseditaccount',
        builder: (BuildContext context, GoRouterState state) =>
            MembersEditAccountScreen(
          colindex: 0,
        ),
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

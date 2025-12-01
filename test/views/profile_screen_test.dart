import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  group('ProfileScreen Widget Tests', () {
    testWidgets('displays avatar, name, and email', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      // Avatar
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);

      // Name
      expect(find.text('Your Name'), findsOneWidget);

      // Email
      expect(find.text('your.email@example.com'), findsOneWidget);
    });

    testWidgets('shows Edit Profile and Log Out buttons', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      expect(find.widgetWithIcon(ListTile, Icons.edit), findsOneWidget);
      expect(find.widgetWithIcon(ListTile, Icons.logout), findsOneWidget);
      expect(find.text('Edit Profile'), findsOneWidget);
      expect(find.text('Log Out'), findsOneWidget);
    });

    testWidgets('Edit Profile and Log Out buttons are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      await tester.tap(find.text('Edit Profile'));
      await tester.pump();
      await tester.tap(find.text('Log Out'));
      await tester.pump();
      // No navigation or state change expected yet (TODOs)
    });

    testWidgets('has a Profile app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
      expect(find.text('Profile'), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:reminder/features/reminder/presentation/pages/reminder_screen.dart';
import 'package:reminder/injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ReminderScreen(),
    );
  }
}

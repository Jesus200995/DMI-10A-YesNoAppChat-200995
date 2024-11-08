import 'package:flutter/material.dart';

import 'package:app_chat_200995/config/theme/app_theme.dart';
import 'package:app_chat_200995/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme( selectedColor: 1).theme(),
      home: const ChatScreen()
    );
  }
}
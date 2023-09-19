import 'package:flutter/material.dart';

class ChangeDesignScreen extends StatefulWidget {
  const ChangeDesignScreen({super.key});

  @override
  State<ChangeDesignScreen> createState() => _ChangeDesignScreenState();
}

class _ChangeDesignScreenState extends State<ChangeDesignScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Change design',
    );
  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(title),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}

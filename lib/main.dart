import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiji/features/cubit/jiji_cubit.dart';
import 'package:jiji/features/view/jiji_view.dart';

void main() {
  runApp(const JijiApp());
}

class JijiApp extends StatelessWidget {
  const JijiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JijiCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JijiScreen(),
      ),
    );
  }
}

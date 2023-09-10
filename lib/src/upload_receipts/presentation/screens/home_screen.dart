import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Super App'),
          ),
        ),
      );
}

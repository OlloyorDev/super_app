import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';

class ReceiptsScreen extends StatefulWidget {
  const ReceiptsScreen({super.key});

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Super App'),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/src/home/presentation/bloc/home_bloc.dart';

class AllReceiptsScreen extends StatefulWidget {
  const AllReceiptsScreen({super.key});

  @override
  State<AllReceiptsScreen> createState() => _AllReceiptsScreenState();
}

class _AllReceiptsScreenState extends State<AllReceiptsScreen> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Super App'),
          ),
        ),
      );
}

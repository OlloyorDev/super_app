import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/data/source/database_helper.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.databaseHelper,
  }) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
  }

  final DatabaseHelper databaseHelper;
}

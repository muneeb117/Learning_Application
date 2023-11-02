import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_events.dart';
import 'package:ulearning/pages/home/bloc/home_states.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class HomeBlocs extends Bloc<HomeEvents,HomeStates>{
  HomeBlocs():super(HomeStates()){
    on<HomeEvents>((event, emit) {
      emit(HomeStates(tapIndex: state.tapIndex,page: state.page));
    });
  }
}
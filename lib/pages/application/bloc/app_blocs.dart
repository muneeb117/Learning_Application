import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';
import 'app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggeredEvents>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }
}

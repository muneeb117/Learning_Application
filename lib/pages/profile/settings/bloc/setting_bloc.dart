import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_state.dart';
import 'package:ulearning/pages/profile/settings/bloc/state_event.dart';

class SettingBlocs extends Bloc<SettingEvents,SettingStates>{
  SettingBlocs():super(SettingStates()){
    on<TriggeredEvents>(_triggeredEvents);
  }
  _triggeredEvents(SettingEvents,Emitter<SettingStates>emit){
    emit(SettingStates());
  }
}
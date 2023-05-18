import 'package:clinicmanagement/Components.dart/cachHelper.dart';
import 'package:clinicmanagement/Screens/infoDoctor/profileState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  bool showHours = false;

  void toggle() {
    showHours = !showHours;
    emit(ShowAvailableTimeSuccessfuly());
  }
}

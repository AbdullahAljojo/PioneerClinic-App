import 'package:clinicmanagement/Screens/Login/InputWarapper.dart';
import 'package:clinicmanagement/Screens/Login/loginState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Role { doctor, user }

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());
  Role role = Role.doctor;
  static LoginCubit get(context) => BlocProvider.of(context);

  void ChangeUser() {
    role = Role.user;
    emit(RoleUser());
  }

  void ChangeDoctor() {
    role = Role.doctor;
    emit(RoleDoctor());
  }
}

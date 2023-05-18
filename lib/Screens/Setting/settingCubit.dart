import 'package:clinicmanagement/components.dart/cachHelper.dart';
import 'package:clinicmanagement/Screens/Setting/settingStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(InitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeMode());
    }
    else{
 isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark);
    print(isDark);

    emit(ChangeMode());
    }
   
  }

  bool isDark = false;
}

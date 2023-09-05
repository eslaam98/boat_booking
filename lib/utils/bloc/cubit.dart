import 'package:boat_booking/utils/bloc/states.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  // ThemeMode appMode = ThemeMode.dark;
  bool isDarkModeEnabled = false;
  int currentIndex = 0;
  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDarkModeEnabled = fromShared;
      emit(AppChangeThemeModeStates());
    } else {
      isDarkModeEnabled = !isDarkModeEnabled;
      SaveMode.putModeTheme(key: 'isDark', value: isDarkModeEnabled)
          .then((value) {
        emit(AppChangeThemeModeStates());
      });
    }
  }
}

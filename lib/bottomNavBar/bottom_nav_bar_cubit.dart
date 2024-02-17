import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);

  updatePageIndex(int index) {
    emit(index);
  }

  resetCubit() {
    emit(0);
  }
}

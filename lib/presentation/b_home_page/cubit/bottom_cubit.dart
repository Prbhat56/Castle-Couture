import 'package:castle_couture/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCubit extends Cubit<int> {
  BottomCubit() : super(0);
  final PageController pageController = PageController();

  void changePage(int index) {
    emit(index);
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 300), curve: Curves.ease);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

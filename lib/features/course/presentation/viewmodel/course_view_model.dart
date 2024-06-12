import 'package:clean_architecture/features/course/domain/entity/course_entity.dart';
import 'package:clean_architecture/features/course/domain/use_case/course_usecase.dart';
import 'package:clean_architecture/features/course/presentation/state/course_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseViewModelProvider = StateNotifierProvider<CourseViewModel, CourseState>((ref) {
  return CourseViewModel(ref.read(courseUseCaseProvider));
});

class CourseViewModel extends StateNotifier<CourseState> {
  CourseViewModel(this.courseUseCase) : super(CourseState.initial()) {
    getAllCourses();
  }

  final CourseUseCase courseUseCase;

  addCourse(CourseEntity course) async {
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.addCourse(course);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
      },
    );
    getAllCourses();
  }

  getAllCourses() async {
    state = state.copyWith(isLoading: true);
    var data = await courseUseCase.getAllCourses();
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state = state.copyWith(isLoading: false, lstCourses: r, error: null);
      },
    );
  }
}

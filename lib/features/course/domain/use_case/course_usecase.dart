import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/features/course/domain/entity/course_entity.dart';
import 'package:clean_architecture/features/course/domain/repository/course_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseUseCaseProvider = Provider((ref) {
  return CourseUseCase(courseRepository: ref.read(courseRepositoryProvider));
});

class CourseUseCase {
  final ICourseRepository courseRepository;

  CourseUseCase({required this.courseRepository});

  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRepository.addCourse(course);
  }

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRepository.getAllCourses();
  }
}

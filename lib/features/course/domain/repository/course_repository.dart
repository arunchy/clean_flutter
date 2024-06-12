import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/features/course/data/repository/course_local_repository.dart';
import 'package:clean_architecture/features/course/domain/entity/course_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final courseRepositoryProvider = Provider<ICourseRepository>((ref) {
  return ref.read(courseLocalRepository);
});

abstract class ICourseRepository {
  Future<Either<Failure, bool>> addCourse(CourseEntity course);
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
}

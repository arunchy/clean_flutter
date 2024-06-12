import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/core/networking/local/course_local_datasource.dart';
import 'package:clean_architecture/features/course/domain/repository/course_repository.dart';
import 'package:clean_architecture/features/course/domain/entity/course_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';

final courseLocalRepository = Provider<ICourseRepository>((ref) {
  return CourseLocalRepository(courseLocalDatasource: ref.read(courseLocalDataSourceProvider));
});

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalDatasource courseLocalDatasource;
  
  CourseLocalRepository({required this.courseLocalDatasource});
  
  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseLocalDatasource.addCourse(course);
  }
  
  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseLocalDatasource.getAllCourses();
  }
}

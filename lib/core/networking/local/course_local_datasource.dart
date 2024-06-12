import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/core/networking/local/hive_service.dart';
import 'package:clean_architecture/features/course/data/model/course_hive_model.dart';
import 'package:clean_architecture/features/course/domain/entity/course_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseLocalDataSourceProvider = Provider(
  (ref) => CourseLocalDatasource(
    hiveService: ref.read(hiveServiceProvider),
    courseHiveModel: ref.read(courseHiveModelProvider),
  ),
);

class CourseLocalDatasource {
  final HiveService hiveService;
  final CourseHiveModel courseHiveModel;

  CourseLocalDatasource({
    required this.hiveService,
    required this.courseHiveModel,
  });

  // Add Course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      // Convert Entity to Hive object
      final hiveCourse = courseHiveModel.fromEntity(course);
      await hiveService.addCourse(hiveCourse);
      return const Right(true);
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }

  // Get All Courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final hiveCourses = await hiveService.getAllCourses();
      final courses = courseHiveModel.toEntityList(hiveCourses);
      return Right(courses);
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }
}

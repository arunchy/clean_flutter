import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/features/batch/data/repository/batch_local_repository.dart';
import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final batchRepositoryProvider=Provider<IBatchRepository>((ref){
  return ref.read(batchLocalRepository);
});
abstract class IBatchRepository{
  Future<Either<Failure,bool>> addBatch(BatchEntity batch);
  Future<Either<Failure,List<BatchEntity>>> getAllBatch();
}
import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:clean_architecture/features/batch/domain/repository/batch_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final batchUseCaseProvider=Provider((ref){
  return BatchUseCase(batchRepository: ref.read(batchRepositoryProvider));
});

class BatchUseCase{
  final IBatchRepository batchRepository;
  BatchUseCase({required this.batchRepository});
  Future<Either<Failure,bool>> addBatch(BatchEntity batch){
    return batchRepository.addBatch(batch);
  }
  Future<Either<Failure,List<BatchEntity>>> getAllBatches(){
    return batchRepository.getAllBatch();
  }
}

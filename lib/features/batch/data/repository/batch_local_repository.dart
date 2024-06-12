import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/core/networking/local/batch_local_datasource.dart';
import 'package:clean_architecture/features/batch/domain/repository/batch_repository.dart';
import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';

final batchLocalRepository=Provider<IBatchRepository>((ref){
  return BatchLocalRepository(batchLocalDatasource: ref.read(batchLocalDataSourceProvider));
});

class BatchLocalRepository implements IBatchRepository{
  final BatchLocalDatasource batchLocalDatasource;
  BatchLocalRepository({required this.batchLocalDatasource});
 @override
  Future<Either<Failure,bool>> addBatch(BatchEntity batch){
   return batchLocalDatasource.addBatch(batch);
 }
 @override
  Future<Either<Failure,List<BatchEntity>>> getAllBatch(){
   return batchLocalDatasource.getAllBatches();
 }
}
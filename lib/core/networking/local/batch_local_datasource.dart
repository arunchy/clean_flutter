import 'package:clean_architecture/core/failure/failure.dart';
import 'package:clean_architecture/core/networking/local/hive_service.dart';
import 'package:clean_architecture/features/batch/data/model/batch_hive_model.dart';
import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final batchLocalDataSourceProvider=Provider(
    (ref)=>BatchLocalDatasource(hiveService: ref.read(hiveServiceProvider), batchHiveModel:ref.read(batchHiveModelProvider))
);

class BatchLocalDatasource{
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;
  BatchLocalDatasource({
   required this.hiveService,
   required this.batchHiveModel
});

  //Add Batch
Future<Either<Failure,bool>> addBatch(BatchEntity batch)async{
  try{
    //convert Entity to Hive object
    final hiveBatch=batchHiveModel.fromEntity(batch);
    await hiveService.addBatch(hiveBatch);
    return const Right(true);
  }catch(error){
   return Left(Failure(error: error.toString()));
  }
}
Future<Either<Failure,List<BatchEntity>>> getAllBatches() async{
  try{
    final hiveBatches=await hiveService.getAllBatches();
    final batches=batchHiveModel.toEntityList(hiveBatches);
    return Right(batches);
  }catch(error){
    return Left(Failure(error: error.toString()));
  }
}

}




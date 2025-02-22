import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture/app/constants/hive_table_constant.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

final batchHiveModelProvider=Provider((ref)=>BatchHiveModel.empty(),);

@HiveType(typeId:HiveTableConstant.batchTableId)
class BatchHiveModel{
 @HiveField(0)
  final String? batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({
   String ? batchId,
    required this.batchName,
}):batchId=batchId ?? const Uuid().v4();

  BatchHiveModel.empty():
     batchId="",
     batchName="";


  //convert Hive Object to Entity
BatchEntity toEntity()=>BatchEntity(batchId: batchId,batchName: batchName);
//convert Entity to Hive Object
BatchHiveModel fromEntity(BatchEntity entity)=>BatchHiveModel(batchId: entity.batchId,batchName: entity.batchName);
//convert Hive List to Entity List
List<BatchEntity> toEntityList(List<BatchHiveModel> models)=>models.map((model)=>model.toEntity()).toList();

}
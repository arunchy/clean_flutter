import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';


class BatchState{
final List<BatchEntity> lstBatches;
final bool isLoading;
final String ? error;
BatchState({
  required this.lstBatches,
  required this.isLoading,
  this.error
});
factory BatchState.inital(){
  return BatchState(
   lstBatches: [],
    isLoading: false,
    error: null,
  );
}

BatchState copyWith({
  List<BatchEntity> ? lstBatches,
  bool ? isLoading,
  String ? error,
}){
  return BatchState(
    lstBatches: lstBatches ?? this.lstBatches,
    isLoading:  isLoading ?? this.isLoading,
    error:error ?? this.error
  );

}

}
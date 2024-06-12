import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:clean_architecture/features/batch/domain/use_case/batch_use_case.dart';
import 'package:clean_architecture/features/batch/presentation/state/batch_state.dart';
import 'package:riverpod/riverpod.dart';

final batchViewModelProvider=StateNotifierProvider<BatchViewModel,BatchState>((ref){
  return BatchViewModel(ref.read(batchUseCaseProvider));
});


class BatchViewModel extends StateNotifier<BatchState>{
  BatchViewModel(this.batchUseCase) : super(BatchState.inital()){
    getAllBatches();
  }
  final BatchUseCase batchUseCase;

  addBatch(BatchEntity batch)async{
    state=state.copyWith(isLoading: true);
    var data=await batchUseCase.addBatch(batch);
    data.fold(
        (l){
          state=state.copyWith(isLoading: false,error: l.error);
        },
        (r){
       state.copyWith(isLoading: false,error: null);
        }
    );
    getAllBatches();
  }


  //for getting all batches
getAllBatches()async{
    state=state.copyWith(isLoading: true);
    var data=await batchUseCase.getAllBatches();
    data.fold(
        (l){
          state=state.copyWith(isLoading: false,error: l.error);
        },
        (r){
          state=state.copyWith(isLoading: false,lstBatches: r,error: null);
        }
    );
}

}
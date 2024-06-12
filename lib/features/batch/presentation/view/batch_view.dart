import 'package:clean_architecture/features/batch/data/model/batch_hive_model.dart';
import 'package:clean_architecture/features/batch/domain/entity/batch_entity.dart';
import 'package:clean_architecture/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<BatchView> createState() => _BatchViewState();
}

class _BatchViewState extends ConsumerState<BatchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
    var batchViewModel = ref.read(batchViewModelProvider.notifier);

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add Batch',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final batchName = _controller.text;
                  if (batchName.isNotEmpty) {
                    batchViewModel.addBatch(BatchEntity(batchName: batchName));
                    _controller.clear();
                  }
                },
                child: const Text('Add Batch'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "List of Batch",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            if (batchState.isLoading) ...{
              const Center(child: CircularProgressIndicator()),
            } else if (batchState.error != null) ...{
              Text(batchState.error.toString()),
            } else if (batchState.lstBatches.isEmpty) ...{
              const Center(child: Text("No Batches")),
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: batchState.lstBatches.length,
                  itemBuilder: (context, index) {
                    var batch = batchState.lstBatches[index];
                    return ListTile(
                      title: Text(batch.batchName),
                      subtitle: Text(batch.batchName),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // batchViewModel.deleteBatch(batch);
                        },
                      ),
                    );
                  },
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}

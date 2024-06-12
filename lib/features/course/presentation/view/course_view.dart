import 'package:clean_architecture/features/course/domain/entity/course_entity.dart';
import 'package:clean_architecture/features/course/presentation/viewmodel/course_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseView extends ConsumerStatefulWidget {
  const CourseView({super.key});

  @override
  ConsumerState<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends ConsumerState<CourseView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var courseState = ref.watch(courseViewModelProvider);
    var courseViewModel = ref.read(courseViewModelProvider.notifier);

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add Course',
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
                  final courseName = _controller.text;
                  if (courseName.isNotEmpty) {
                    courseViewModel.addCourse(CourseEntity(courseName: courseName));
                    _controller.clear();
                  }
                },
                child: const Text('Add Course'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "List of Courses",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            if (courseState.isLoading) ...{
              const Center(child: CircularProgressIndicator()),
            } else if (courseState.error != null) ...{
              Text(courseState.error.toString()),
            } else if (courseState.lstCourses.isEmpty) ...{
              const Center(child: Text("No Courses")),
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: courseState.lstCourses.length,
                  itemBuilder: (context, index) {
                    var course = courseState.lstCourses[index];
                    return ListTile(
                      title: Text(course.courseName),
                      subtitle: Text(course.courseName),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // courseViewModel.deleteCourse(course);
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

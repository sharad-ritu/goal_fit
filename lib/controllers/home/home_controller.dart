import 'package:get/get.dart';

class ExerciseItem {
  final String name;
  final String tag; // Back/Hips/Abs/Legs
  final String imagePath;
  final String sets;
  final String reps;

  const ExerciseItem({
    required this.name,
    required this.tag,
    required this.imagePath,
    required this.sets,
    required this.reps,
  });
}

class HomeController extends GetxController {
  final RxString selectedTag = 'All'.obs;
  final tags = const ['All', 'Back', 'Hips', 'Abs', 'Legs'];

  // 12 static demo exercises (reuse same 2 assets for images)
  final List<ExerciseItem> exercises = const [
    // Back (3)
    ExerciseItem(
      name: 'Pull-ups',
      tag: 'Back',
      imagePath: 'assets/home/home-2.png',
      sets: '3-4',
      reps: '8-12',
    ),
    ExerciseItem(
      name: 'Bent-over rows',
      tag: 'Back',
      imagePath: 'assets/home/home-3.png',
      sets: '3-4',
      reps: '10-12',
    ),
    ExerciseItem(
      name: 'Lat pulldown',
      tag: 'Back',
      imagePath: 'assets/home/home-2.png',
      sets: '3',
      reps: '10-15',
    ),

    // Hips (3)
    ExerciseItem(
      name: 'Hip thrust',
      tag: 'Hips',
      imagePath: 'assets/home/home-3.png',
      sets: '4',
      reps: '10-12',
    ),
    ExerciseItem(
      name: 'Glute bridge',
      tag: 'Hips',
      imagePath: 'assets/home/home-2.png',
      sets: '3',
      reps: '12-15',
    ),
    ExerciseItem(
      name: 'Donkey kicks',
      tag: 'Hips',
      imagePath: 'assets/home/home-3.png',
      sets: '3',
      reps: '12-20',
    ),

    // Abs (3)
    ExerciseItem(
      name: 'Plank hold',
      tag: 'Abs',
      imagePath: 'assets/home/home-2.png',
      sets: '3',
      reps: '30-60s',
    ),
    ExerciseItem(
      name: 'Crunches',
      tag: 'Abs',
      imagePath: 'assets/home/home-3.png',
      sets: '3',
      reps: '15-20',
    ),
    ExerciseItem(
      name: 'Russian twists',
      tag: 'Abs',
      imagePath: 'assets/home/home-2.png',
      sets: '3',
      reps: '20-30',
    ),

    // Legs (3)
    ExerciseItem(
      name: 'Bodyweight squats',
      tag: 'Legs',
      imagePath: 'assets/home/home-3.png',
      sets: '3-4',
      reps: '12-15',
    ),
    ExerciseItem(
      name: 'Lunges',
      tag: 'Legs',
      imagePath: 'assets/home/home-2.png',
      sets: '3',
      reps: '10-12',
    ),
    ExerciseItem(
      name: 'Calf raises',
      tag: 'Legs',
      imagePath: 'assets/home/home-3.png',
      sets: '4',
      reps: '15-20',
    ),
  ];

  void changeTag(String tag) {
    selectedTag.value = tag;
  }

  // Computed list based on selected tag
  List<ExerciseItem> get filteredExercises {
    final tag = selectedTag.value;
    if (tag == 'All') return exercises;
    return exercises.where((e) => e.tag == tag).toList();
  }
}

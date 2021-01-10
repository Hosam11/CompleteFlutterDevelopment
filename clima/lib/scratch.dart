void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // we wait before we call task2 we going to it for it to finished
  String t2 = await task2();
  task3(t2);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// we have return fu is something will exist in future
// once task has complete our future will be actual thing like actual string
Future task2() async {
  String result;
  Duration duration = Duration(seconds: 3);

  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('task 2 complete');
  });

  return result;
}

void task3(String t2) {
  String result = 'task 3 data';
  print('Task 3 complete t2Data= $t2');
}

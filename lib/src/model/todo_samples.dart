import 'todo.dart';

abstract class TodoSamples {
  static List<Todo> todos = [
    Todo(date: DateTime.now(), content: '응용 프로그래밍 개발 과제'),
    Todo(date: DateTime(2024, 6, 3), content: '수학 수행평가 챙기기'),
    Todo(date: DateTime(2024, 5, 28), content: '세특 자료 작성'),
    Todo(date: DateTime(2024, 6, 1), content: '영어 학원 숙제 꼭 하기!'),
    Todo(date: DateTime(2024, 5, 13), content: '화학 서술형 점수 확인'),
  ];
}

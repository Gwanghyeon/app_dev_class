// 할일 정보를 저장하는 클래스
class Todo {
  // 날짜
  DateTime date;
  // 내용
  String content;
  // 완료여부
  bool isDone;

  // 생성자
  Todo({
    required this.date,
    required this.content,
    this.isDone = false,
  });

  Todo copyWith({
    DateTime? date,
    String? content,
    bool? isDone,
  }) {
    return Todo(
      date: date ?? this.date,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
    );
  }
}

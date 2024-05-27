// Tile : 체크박스, 할일내용, 날짜, D-day
import 'package:flutter/material.dart';
import 'package:new_todos/res/util.dart';

import '../../res/palette.dart';
import '../model/todo.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListTile(
        // 체크박스
        leading: GestureDetector(
          onTap: () {
            // widget: 상위 위젯 ->
            widget.todo.isDone = !widget.todo.isDone;
            setState(() {}); // build를 재호출
          },
          child: (widget.todo.isDone)
              ? const Icon(Icons.check_box_outlined)
              : const Icon(Icons.check_box_outline_blank),
        ), // 할일 내용
        title: Text(widget.todo.content),
        // 날짜
        subtitle: Text(Util.dateToString(widget.todo.date)),
        // D-day
        trailing: Text(Util.getDday(widget.todo.date)),

        // 디자인
        tileColor: Palette.coral,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

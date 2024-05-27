import 'package:flutter/material.dart';
import 'package:new_todos/res/util.dart';
import 'package:new_todos/src/model/todo.dart';

import '../../res/palette.dart';
import '../_widgets/todo_tile.dart';
import '../model/todo_samples.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // 텍스트 값을 읽어오기위한 컨트롤러
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '오늘 꼭 해야 할 일!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Palette.blue,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: () {
          DateTime date = DateTime.now();
          // 할일 추가
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  Util.dateToString(date),
                  style: const TextStyle(fontSize: 20),
                ),
                // 텍스트값을 받아오는 위젯
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: '할일을 입력해주세요'),
                  autofocus: true,
                ),
                // 버튼 파트
                actions: [
                  // 취소 버튼
                  TextButton(
                      onPressed: () {
                        controller.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('취소')),
                  // 확인 버튼
                  TextButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          // 새로운 Todo 인스턴스
                          final newTodo = Todo(
                              date: DateTime.now(), content: controller.text);
                          // 새로운 인스턴스를 리스트에 추가
                          TodoSamples.todos.add(newTodo);
                          // 화면 갱신
                          setState(() {});
                          controller.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('확인')),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: TodoSamples.todos.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 28),
                child: const Icon(Icons.delete),
              ),
              // 확인
              confirmDismiss: (_) async {
                return await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('항목을 삭제합니다'),
                    actions: [
                      // 취소버튼 -> false
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('취소'),
                      ),
                      // 확인 버튼
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('확인'),
                      ),
                    ],
                  ),
                );
              },
              // 확인(true)인 경우 실행되는 함수
              onDismissed: (_) {
                // 리스트에서 항목 삭제
                TodoSamples.todos.removeAt(index);
                setState(() {});
              },
              child: TodoTile(todo: TodoSamples.todos[index]),
            );
          },
        ),
      ),
    );
  }
}

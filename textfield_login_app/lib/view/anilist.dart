import 'package:flutter/material.dart';
import 'package:textfield_login_app/model/saved.dart';

class AniList extends StatefulWidget {
  final List<Animal> list;
  const AniList({super.key, required this.list});

  @override
  State<AniList> createState() => _AniListState();
}

class _AniListState extends State<AniList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => show(index),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                    ),
                    Text('                    ${widget.list[index].animalName}')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
show(index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black38,
      builder: (context) {
        return AlertDialog(
          title: Text(
            widget.list[index].animalName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Row(
            children: [
              Image.asset(
                widget.list[index].imagePath,
                width: 50,
              ),
              Text('이 동물은 ${widget.list[index].kind} 입니다. \n'
                  '${widget.list[index].flyExist ? '날수 있습니다.' : '날 수 없습니다.'}')
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('종료'))
          ],
        );
      },
    );
  }

}
import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';

class MiniTaskCard extends StatelessWidget {
  final TaskModel task;

  MiniTaskCard(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 30, 25, 20),
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.task.category,
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 14, color: Theme.of(context).primaryColor,),
              ),
              SizedBox(height: 10),
              Text(
                this.task.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87, height: 0.9,),
              ),
              SizedBox(height: 10),
              Row(
                children: List.generate(this.task.tags.length, (int index) {
                  Color color;
                  switch (index) {
                    case 0:
                      color = Colors.purple;
                      break;
                    case 1:
                      color = Colors.green;
                      break;
                    case 2:
                      color = Colors.amber;
                      break;
                  }
                  return _CustomChip(
                    label: '#${this.task.tags[index]}',
                    color: color,
                  );
                }),
              ),
              SizedBox(height: 15),
              Text(this.task.summary, style: TextStyle(color: Colors.grey.shade400, height: 1.2, fontWeight: FontWeight.w500),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '${this.task.comments} comments',
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 15, color: Theme.of(context).primaryColor,),
              ),
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomChip extends StatelessWidget {
  final String label;
  final Color color;

  _CustomChip({
    this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
      margin: EdgeInsets.only(right: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: this.color.withOpacity(0.1)),
      child: Text(
        this.label,
        style: TextStyle(fontSize: 13, color: this.color, fontWeight: FontWeight.bold),
      ),
    );
  }
}

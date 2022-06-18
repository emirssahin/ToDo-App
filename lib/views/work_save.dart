import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/works_cubit.dart';

class WorkSave extends StatefulWidget {
  const WorkSave({Key? key}) : super(key: key);

  @override
  State<WorkSave> createState() => _WorkSaveState();
}

class _WorkSaveState extends State<WorkSave> {
  var tfControllerWork = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save works", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 280,
              child: TextField(
                controller: tfControllerWork,
                decoration: const InputDecoration(hintText: "Work to do"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<WorksCubit>().save(tfControllerWork.text);
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }
}

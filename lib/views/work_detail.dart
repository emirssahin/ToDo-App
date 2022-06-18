import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/works_detail_cubit.dart';
import 'package:to_do_application/entity/works.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkDetail extends StatefulWidget {
  Works works;

  WorkDetail({required this.works});

  @override
  State<WorkDetail> createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
  var tfControllerWork = TextEditingController();

  void initState() {
    super.initState();
    tfControllerWork.text = widget.works.work_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Work Details",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 230,
              child: TextField(
                controller: tfControllerWork,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<WorksDetailCubit>()
                      .update(widget.works.work_id, tfControllerWork.text);
                },
                child: Text("Update")),
          ],
        ),
      ),
    );
  }
}

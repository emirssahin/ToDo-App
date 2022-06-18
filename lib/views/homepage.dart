import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/homepage_cubit.dart';
import 'package:to_do_application/entity/works.dart';
import 'package:to_do_application/views/work_detail.dart';
import 'package:to_do_application/views/work_save.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSearching = false;

  void initState() {
    super.initState();
    context.read<HomepageCubit>().showWorks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: InputDecoration(hintText: "Search"),
                onChanged: (searchResult) {
                  context.read<HomepageCubit>().search(searchResult);
                },
              )
            : const Text(
                "Works",
                style: TextStyle(fontSize: 25),
              ),
        centerTitle: true,
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isSearching = false;
                      },
                    );
                    context.read<HomepageCubit>().showWorks();
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isSearching = true;
                      },
                    );
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomepageCubit, List<Works>>(
        builder: (context, toDoList) {
          if (toDoList.isNotEmpty) {
            return ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, indeks) {
                  var toDo = toDoList[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkDetail(works: toDo))).then((_) {
                        context.read<HomepageCubit>().showWorks();
                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "${toDo.work_name}",
                              style: TextStyle(fontSize: 20),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("${toDo.work_name} Delete?"),
                                    action: SnackBarAction(
                                      label: "Yes",
                                      onPressed: () {
                                        context
                                            .read<HomepageCubit>()
                                            .delete(toDo.work_id);
                                        context
                                            .read<HomepageCubit>()
                                            .showWorks();
                                      },
                                    ),
                                  ));
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkSave(),
              ),
            ).then(
              (_) {
                context.read<HomepageCubit>().showWorks();
              },
            );
          },
        ),
      ),
    );
  }
}

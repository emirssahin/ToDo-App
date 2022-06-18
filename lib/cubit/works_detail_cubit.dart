import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/cubit/works_cubit.dart';
import 'package:to_do_application/repo/works_dao_repository.dart';

class WorksDetailCubit extends Cubit<void> {
  WorksDetailCubit() : super(0);

  var yRepo = WorksDaoRepository();

  Future<void> update(int work_id, String work_name) async {
    await yRepo.updateWork(work_id, work_name);
  }
}

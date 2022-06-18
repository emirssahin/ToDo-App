import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/repo/works_dao_repository.dart';

class WorksCubit extends Cubit<void> {
  WorksCubit() : super(0);

  var yRepo = WorksDaoRepository();

  Future<void> save(String work_name) async {
    await yRepo.saveWork(work_name);
  }
}

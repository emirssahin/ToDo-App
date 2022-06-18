import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/entity/works.dart';
import 'package:to_do_application/repo/works_dao_repository.dart';
import 'package:to_do_application/views/homepage.dart';

class HomepageCubit extends Cubit<List<Works>> {
  HomepageCubit() : super(<Works>[]);

  var yRepo = WorksDaoRepository();

  Future<void> showWorks() async {
    var liste = await yRepo.showWorks();
    emit(liste);
  }

  Future<void> search(String searchingWord) async {
    var liste = await yRepo.makeSearch(searchingWord);
    emit(liste);
  }

  Future<void> delete(int work_id) async {
    await yRepo.deleteWork(work_id);
  }
}

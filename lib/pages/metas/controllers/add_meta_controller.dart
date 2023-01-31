import '../metas_model.dart';
import '../metas_repository.dart';

class AddMetaController {
  final MetasRepository _metasRepository;

  AddMetaController([MetasRepository? repository])
      : _metasRepository = repository ?? MetasRepository();

  Future<String> createMeta(MetasModel meta) async {
    try {
      await _metasRepository.addMeta(meta: meta);
      return 'Success';
    } catch (e) {
      return 'Error';
    }
  }
}

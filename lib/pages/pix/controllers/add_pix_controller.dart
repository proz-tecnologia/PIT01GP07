import 'package:teste/pages/pix/pix_model.dart';
import 'package:teste/pages/pix/pix_repository.dart';


class AddPixController {
  final PixRepository _pixRepository;

  AddPixController([PixRepository? repository])
      : _pixRepository = repository ?? PixRepository();

  Future<void> createPix(PixModel pix) async {
    try {
      await _pixRepository.addPix(pix: pix);
    } catch (e) {
      rethrow;
    }
  }
}

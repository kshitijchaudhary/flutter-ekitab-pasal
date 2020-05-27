import 'package:ekitaab_pasal/repository/repository.dart';

class BookService {
  Repository _repository;
  BookService(){
    _repository = Repository();
  }

  getBooks() async {
    return await _repository.httpGet('books');
  }
}
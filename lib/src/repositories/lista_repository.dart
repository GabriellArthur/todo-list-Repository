import 'package:app/src/models/lista_model.dart';
import 'package:dio/dio.dart';

class ListaRepository {
  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  ListaRepository([Dio client]) : dio = client ?? Dio();

  Future<List<ListaModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List; //cash de list
    return list.map((json) => ListaModel.fromJson(json)).toList();
  }
}

import 'package:dio/dio.dart';
import 'package:via_cep/via_cep.dart';

class ViaCepService {

  Future<void> getAddressFromCep(String cep) async {
    final cleanCep = cep.replaceAll('.', '').replaceAll('-', '');
    final endPoint = "https://viacep.com.br/ws/$cleanCep/json/";

    final Dio dio = Dio();

    try {
      final response = await dio.get<Map>(endPoint);

      if(response.data.isEmpty){
        return Future.error('CEP Inváido');

      }

      print(response.data);
    } on DioError catch (e) {
      return Future.error('Erro ao Buscar CEP');
    }

  }

}
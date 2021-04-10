import 'package:dio/dio.dart';
import 'package:new_game_store/models/viacep_address.dart';

class ViaCepService {

  Future<ViaCepAddress> getAddressFromCep(String cep) async {
    final cleanCep = cep.replaceAll('.', '').replaceAll('-', '');
    final endPoint = "https://viacep.com.br/ws/$cleanCep/json/";

    final Dio dio = Dio();

    try {
      final response = await dio.get<Map>(endPoint);

      if(response.data.isEmpty){
        return Future.error('CEP Inváido');

      }

      final ViaCepAddress address = ViaCepAddress.fromMap(response.data);

      return address;
    } on DioError catch (e) {
      return Future.error('Erro ao Buscar CEP');
    }

  }

}
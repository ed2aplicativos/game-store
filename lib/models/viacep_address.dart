class ViaCepAddress {

  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  ViaCepAddress.fromMap(Map<String, dynamic> map) :
    cep = map['cep'] as String,
    logradouro = map['logradouro'] as String,
    bairro = map['bairro'] as String,
    localidade = map['localidade'] as String,
    uf = map['uf'] as String;

  @override
  String toString() {
    return 'ViaCepAddress{cep: $cep, logradouro: $logradouro, bairro: $bairro, localidade: $localidade, uf: $uf}';
  }
}
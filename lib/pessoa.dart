class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa({required this.nome, required this.altura, required this.peso});

  double calculaImc() {
    return (this.peso / (this.altura * altura));
  }

  String indicaSituacao() {
    double imc = calculaImc();
    String situacao;
    if (imc > 20) {
      situacao = "Acima do peso";
    } else {
      situacao = "Peso normal";
    }

    return situacao;
  }
}

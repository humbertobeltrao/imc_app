class PessoaImc {
  double peso;
  double altura;
  String nome;

  PessoaImc({required this.peso, required this.altura, required this.nome});

  double calculaImc() {
    return (this.peso / (this.altura * this.altura));
  }

  String indicaSituacao() {
    double imc = calculaImc();
    String situacao;
    if (imc > 20) {
      situacao = "Peso normal";
    } else {
      situacao = "Acima do peso";
    }
    return situacao;
  }
}

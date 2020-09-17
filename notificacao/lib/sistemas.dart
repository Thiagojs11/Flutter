class Sistema {
  SistemaProc sistemaProc;
  String dataAnalise;
  int qtRegistro;
  String objAnalise;
  String indicador;

  Sistema(
      {this.sistemaProc,
      this.dataAnalise,
      this.qtRegistro,
      this.objAnalise,
      this.indicador});

  Sistema.fromJson(Map<String, dynamic> json) {
    sistemaProc = json['sistemaProc'] != null
        ? new SistemaProc.fromJson(json['sistemaProc'])
        : null;
    dataAnalise = json['dataAnalise'];
    qtRegistro = json['qtRegistro'];
    objAnalise = json['objAnalise'];
    indicador = json['indicador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sistemaProc != null) {
      data['sistemaProc'] = this.sistemaProc.toJson();
    }
    data['dataAnalise'] = this.dataAnalise;
    data['qtRegistro'] = this.qtRegistro;
    data['objAnalise'] = this.objAnalise;
    data['indicador'] = this.indicador;
    return data;
  }
}

class SistemaProc {
  int codigo;
  String descricao;
  String aplicacaoCodigo;
  String dataCadastro;
  String status;
  String dataAtualizacao;
  int qtTolerado;

  SistemaProc(
      {this.codigo,
      this.descricao,
      this.aplicacaoCodigo,
      this.dataCadastro,
      this.status,
      this.dataAtualizacao,
      this.qtTolerado});

  SistemaProc.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    descricao = json['descricao'];
    aplicacaoCodigo = json['aplicacaoCodigo'];
    dataCadastro = json['dataCadastro'];
    status = json['status'];
    dataAtualizacao = json['dataAtualizacao'];
    qtTolerado = json['qtTolerado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['descricao'] = this.descricao;
    data['aplicacaoCodigo'] = this.aplicacaoCodigo;
    data['dataCadastro'] = this.dataCadastro;
    data['status'] = this.status;
    data['dataAtualizacao'] = this.dataAtualizacao;
    data['qtTolerado'] = this.qtTolerado;
    return data;
  }
}

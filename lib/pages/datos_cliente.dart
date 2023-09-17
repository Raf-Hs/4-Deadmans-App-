class Datos_Cliente{

  String IDUsu = "";
  String email = "";
  String clave = "";




Datos_Cliente (this.IDUsu,this.email,this.clave);

 Datos_Cliente.fromJson(Map<String,dynamic >json){

      IDUsu = json['id_usuario'];

      email = json['email'];

     clave = json['clave'];

    



  }










}
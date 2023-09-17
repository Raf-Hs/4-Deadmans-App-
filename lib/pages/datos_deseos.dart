class Datos_Deseos{

  String IDProd = "";
  String Nombre = "";
  String Descripcion = "";
  String Precio = "";
  String Categoria_Id ="";
  String Imagen = "";
  String estado = "";



  Datos_Deseos (this.IDProd,this.Nombre,this.Descripcion,this.Precio,this.Categoria_Id, this.Imagen,this.estado);

  Datos_Deseos.fromJson(Map<String,dynamic >json){

    IDProd = json['idproducto'];

      Nombre = json['nomproducto'];

      Precio = json['precio'];

      Imagen = json['img'];



  }










}
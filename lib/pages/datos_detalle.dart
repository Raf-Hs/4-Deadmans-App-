class Datos_Detalle{

  String IDProd = "";
  String Nombre = "";
  String Descripcion = "";
  String Precio = "";
  String Categoria_Id ="";
  String Imagen = "";
  String estado = "";
    String Cantidad = "";



  Datos_Detalle (this.Nombre,this.Precio, this.Imagen,this.Cantidad);

  Datos_Detalle.fromJson(Map<String,dynamic >json){

        

      Nombre = json['nomproducto'];

      Precio = json['precio'];

      Imagen = json['img'];

      Cantidad = json['cantidad'];

  }










}
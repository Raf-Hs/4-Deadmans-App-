class Datos_Productos{

  String IDProd = "";
  String Nombre = "";
  String Descripcion = "";
  String Precio = "";
  String Categoria_Id ="";
  String Imagen = "";
  String estado = "";
   String Existencias = "";


  Datos_Productos (this.IDProd,this.Nombre,this.Descripcion,this.Precio,this.Categoria_Id, this.Imagen,this.estado,this.Existencias);

  Datos_Productos.fromJson(Map<String,dynamic >json){

      IDProd = json['idproducto'];

      Nombre = json['nomproducto'];

      Precio = json['precio'];

      Imagen = json['img'];

      Existencias = json['existencia'];

  }










}
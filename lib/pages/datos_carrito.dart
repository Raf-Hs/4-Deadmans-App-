class Datos_Carrito{

  String IDProd = "";
   String Cantidad= "";
  String Nombre = "";
  String Descripcion = "";
  String Precio = "";
  String Categoria_Id ="";
  String Imagen = "";
  String estado = "";



  Datos_Carrito(this.IDProd,this.Nombre,this.Descripcion,this.Precio,this.Categoria_Id, this.Imagen,this.estado,this.Cantidad);

  Datos_Carrito.fromJson(Map<String,dynamic >json){

     IDProd = json['idproducto'];

      Nombre = json['nomproducto'];

      Precio = json['precio'];

      Imagen = json['img'];

  }










}
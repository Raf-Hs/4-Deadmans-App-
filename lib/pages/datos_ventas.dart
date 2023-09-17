class Datos_Ventas{

  String IDVenta = "";
  String fecha = "";
   String monto = "";
  



 Datos_Ventas (this.IDVenta,this.fecha,this.monto);

  Datos_Ventas.fromJson(Map<String,dynamic >json){

      IDVenta = json['idventa'];

      fecha = json['fecha'];

      monto= json['monto'];

  }










}
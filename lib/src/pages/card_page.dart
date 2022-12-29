import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {


@override
Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments;
     print(args);

return Scaffold(
body : ListView(
padding: EdgeInsets.all(5.0),
children: [
_getCardTwo(),
_getCard(),
_getCard(),
_getCard(),
_getCardTwo(),
_getCard(),
_getCardTwo(),
_getCard(),
_getCardTwo(),
_getCard(),
_getCard(),
_getCard()
],
),
);
}

Widget _getCard() {
return  Center(
child:  Card(
margin: const EdgeInsets.symmetric(vertical: 18.0),
elevation: 10.0,  
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
child: Column(
mainAxisSize: MainAxisSize.min,
children: <Widget>[
const ListTile(
leading: Icon(Icons.album),
title: Text('The Enchanted Nightingale'),
subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
),
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: <Widget>[
TextButton(
child: const Text('BUY TICKETS'),
onPressed: () {/* ... */},
),
const SizedBox(width: 8),
TextButton(
child: const Text('LISTEN'),
onPressed: () {
_pressed();
},
),
const SizedBox(width: 8),
],
),
SizedBox(height: 18)
],
),
),);
}

void _pressed() {

print('Card');

}

Widget _getCardTwo(){
return Container(
margin: const EdgeInsets.symmetric(vertical: 5.0),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
color: Colors.white,
boxShadow: const <BoxShadow>[
BoxShadow(color: Colors.black26,
blurRadius: 10.0,
spreadRadius: 2.0,
offset: Offset(2.0, 10.0)
)
]
),
child:  ClipRRect(
borderRadius: BorderRadius.circular(30.0),
child: Container(
color: Color.fromARGB(255, 36, 36, 36),
child: Column(
children: [
FadeInImage(
height: 350.0,
fit: BoxFit.cover,
fadeInDuration: Duration( milliseconds: 200 ),
placeholder: AssetImage('assets/jar-loading.gif'), image: NetworkImage( 'https://cdn.pixabay.com/photo/2017/10/01/00/52/ship-2804073_960_720.jpg'  )),
// Image(image: NetworkImage( 'https://cdn.pixabay.com/photo/2017/10/01/00/52/ship-2804073_960_720.jpg'  )),
Container(
padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
child: Text('{"int_estado":1,"int_error":"00","str_detalle":"Se encontraron pagos","int_cantidad_pagos":1,"validado":0,"datos_pagador":{"flt_total_con_iva":145783.7999999999883584678173065185546875,"flt_valor_iva":0,"str_id_pago":286434,"str_descripcion_pago":"PAGO DEL PEDIDO Nº 286434","str_email":"jesusco32@gmail.com","str_id_cliente":"79505340","str_tipo_id":"1","str_nombre_cliente":"Jesús","str_apellido_cliente":"Castaño Orozco  ","str_telefono_cliente":"3115421634","str_opcional1":"opcion 11","str_opcional2":"opcion 12","str_opcional3":"opcion 13","str_opcional4":"opcion 14","str_opcional5":"opcion 15"},"datos_envio":{"fecha":"2021-11-01","hora":"20:31","agente":{"usuario":"MEGAPLEX STARS","foto":"https://www.nutramerican.com/api_MegaplexStar/assets/icons/favicon-96x96.png","id_usuario":116}},"str_res_pago":{"int_ped_numero":"67071390","int_n_pago":"286434","int_pago_terminado":"1","int_estado_pago":"1","str_estado_pago":"APROBADA","dbl_valor_pagado":"145783.8","dbl_total_pago":"145783.8","dbl_valor_iva_pagado":"0","str_descripcion":"PAGO DEL PEDIDO NÂº 286434","str_id_cliente":"79505340","str_nombre":"Jesus Castano","str_apellido":"Orozco","str_telefono":"3115421634","str_email":"jesusco32@gmail.com","str_campo1":"3.6.9","str_campo2":"extra2","str_campo3":"extra3","str_campo4":"","dat_fecha":"2021-11-01 20:32:57","int_id_forma_pago":"40","datos_pago":{"forma_pago":"PSE","str_ticketID":"670713901635816777","int_codigo_servicio":"PSE","int_codigo_banco":"1187015464","str_nombre_banco":"BANCOLOMBIA","str_codigo_transacción":"CC"}}}' ))
],
),

),
),
);
}


}












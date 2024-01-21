# taller_flutter
Container:

alignment: AligmentDirectional.centerEnd
padding: const EdgeInsets.only(right:0, top: 0, bottom: 0)
chilid: 



100% width: double.infinity
fit: BoxFit.cover, ...content
duration: Duration(milliseconds: 300)


Card:
clipBehavior: Clip.antiAlias, //para que la imagen respete los border de la tarjeta
shape: RoundedRectagleBorder(
borderRadius: BorderRadius.circular(15)
),
showColors: AppTheme.primary.withOpacity(.5),


Padding:
padding: EdgeInsets.symetric(horizontal:20, vertical: 15)





  void showAndroid(context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Text('Android'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('este el el contenido'),
                SizedBox(height: 10),
                FlutterLogo(size: 100)
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'))
              ]);
        });
  }
  void showIos(context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
               title: Text('Ios'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('este el el contenido'),
                SizedBox(height: 10),
                FlutterLogo(size: 100)
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'))
              ]);
        });
  }



 Platform.isAndroid ? showAndroid(context) : showIos(context)
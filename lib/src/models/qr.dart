class QR {
  String numFac;
  String nitFac;
  String docAdq;
  String fecFac;
  double valFac;
  double valIva;
  double valOtroIm;
  double valFacIm;
  String cufe;

  QR({
    required this.numFac,
    required this.nitFac,
    required this.docAdq,
    required this.fecFac,
    required this.valFac,
    required this.valIva,
    required this.valOtroIm,
    required this.valFacIm,
    required this.cufe,
  });

  factory QR.fromMap(Map<String, String> map) {
    return QR(
      numFac: map['NumFac'] ?? '',
      nitFac: map['NitFac'] ?? '',
      docAdq: map['DocAdq'] ?? '',
      fecFac: map['FecFac'] ?? '',
      valFac: double.tryParse(map['ValFac'] ?? '0') ?? 0,
      valIva: double.tryParse(map['ValIva'] ?? '0') ?? 0,
      valOtroIm: double.tryParse(map['ValOtroIm'] ?? '0') ?? 0,
      valFacIm: double.tryParse(map['ValFacIm'] ?? '0') ?? 0,
      cufe: map['CUFE'] ?? '',
    );
  }
}
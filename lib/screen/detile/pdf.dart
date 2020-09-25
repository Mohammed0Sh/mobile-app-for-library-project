// import 'package:Library/Api/api_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';




// class Pdff extends StatefulWidget {
//   @override
//   _PdffState createState() => _PdffState();
// }

// class _PdffState extends State<Pdff> {
//   String file = null;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     ApiController().pdfDownLoad('ملف نت').then((value) {

// setState(() {
//   file=value;
// });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return(file == null) ? Center(
//         child: CircularProgressIndicator(),
//       ): PDFViewerScaffold(
//       path:file ,
//     );
//   }
// }
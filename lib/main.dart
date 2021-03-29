import 'package:appfyp/view/mainScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FYPproject',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}


//class Categories extends StatelessWidget {
//@override
//Widget build(BuildContext context) {
//return Categories();
//}
//Widget Categories(){
//return Column(
//children: <Widget>[
//Container(
//width: 65,
//height: 65,
//decoration: BoxDecoration(
//border: ,
//shape: BoxShape.circle
//image: DecorationImage(image:
//NetworkImage(stories[0]['img'],),fit: BoxFit.cover)
//)
//),
//)
//]
//);
//}}

// class CategoriesText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         style: DefaultTextStyle.of(context).style,
//         children: <TextSpan>[
//           TextSpan(
//               text: 'Fruits', style: TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }

// class Cards extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const ListTile(
//               leading: Icon(Icons.album),
//               title: Text('The Enchanted Nightingale'),
//               subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('BUY TICKETS'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('LISTEN'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

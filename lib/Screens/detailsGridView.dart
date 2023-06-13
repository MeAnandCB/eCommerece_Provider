// import 'package:flutter/material.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

// import '../../Const/Colors.dart';

// class Maingridview extends StatelessWidget {
//   final List griddata;
//   final List details;
//   Maingridview({super.key, required this.griddata, required this.details});

//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       padding: EdgeInsets.all(15),
//       staggeredTileBuilder: (index) =>
//           StaggeredTile.count(2, index.isOdd ? 3.5 : 3.5),
//       crossAxisCount: 4,
//       itemCount: 6,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       itemBuilder: (context, index) => Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           color: ShopBackground1,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(7),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height / 6,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(17),
//                       color: ShopBackground,
//                       image: DecorationImage(
//                         image: Image.network(
//                           product.image,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   (index == 3 || index == 5 || index == 0)
//                       ? Container(
//                           height: 15,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.green,
//                           ),
//                           child: Center(
//                             child: Text("New",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 12)),
//                           ),
//                         )
//                       : Container(),
//                   Positioned(
//                       bottom: 5,
//                       right: 5,
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                             size: 18,
//                           ),
//                           Text( product.title,,
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 27, 27, 27),
//                                   fontSize: 12)),
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                          "",
//                         style: TextStyle(
//                           color: ShopButton,
//                           fontSize: 12,
//                         ),
//                       ),
//                       Icon(
//                         Icons.more_horiz,
//                         color: ShopButton,
//                       )
//                     ],
//                   ),
//                   Text(
//                     details[index]['heading'],
//                     style: TextStyle(
//                         color: Shoptext,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     details[index]['description'],
//                     textAlign: TextAlign.left,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                         color: Shoptextlight,
//                         height: 1.5,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('\$${product.price}',
//                         style: TextStyle(
//                             color: Shoptext,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'Details',
//                         style: TextStyle(
//                           color: Shoptext,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

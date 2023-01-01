import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Constants/styles.dart';

class StepsDescription extends StatelessWidget {
  StepsDescription({super.key, required this.step, required this.stepdetail});
  int? step;
  String? stepdetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //steps

        Text(
           "step ${step.toString()}",
           style: stepH,
         ),

        SizedBox(height: 20,),
        //details
        Text(
          stepdetail!,
          style: stepss,
        ),
                SizedBox(height: 30,),

      ],
    );
  }
}


// class StepsDescription extends StatelessWidget {
//   StepsDescription({super.key, required this.step, required this.stepdetail});
//   int? step;
//   String? stepdetail;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height-600,
//       width: Get.width,
//       color: Colors.amberAccent,
//       child: Column(
//         children: [
//           //steps
//           Padding(
//             padding: const EdgeInsets.only( bottom: 10),
//             child: Container(
//               child: Expanded(
//                 flex: 1,
//                 child: Row(
//                   children: [
//                      Text(
//                         "step ",
//                         style: h2,
//                       ),
                    
//                     Text(
//                       step.toString(),
//                       style: h2,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           //details
//           Expanded(flex: 1,
//             child: Container(
//              // height: Get.height-600,
//               color: Colors.brown,
//               child: Text(
//                         stepdetail!,
//                         style: h4,
                    
//                   ),
                
//               ),
//           ),
          
//         ],
//       ),
//     );
//   }
// }
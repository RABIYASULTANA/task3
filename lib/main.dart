import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:ui';
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CourseScreen(),
    );
  }
}

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: UShapeClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.yellowAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios,color: Colors.white,),
                       Text(
                        "Curse",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.more_vert,color: Colors.white,)
                    ],
                  ),
                   SizedBox(height: 40),
                   Row(
                     children: [
                       SizedBox(width: 20,),
                       Column(
                         children: [
                           Text(
                            "Spanish",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                           ),
                           Row(
                             children: [
                               Container(
                                 height: 40,
                                 width: 100,
                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(25),
                                 ),
                                 child: Center(
                                   child: const Text(
                                     "Beginner",
                                     style: TextStyle(color: Colors.orangeAccent,fontSize: 16),
                                   ),
                                 ),
                               ),
                             ],
                           ),

                         ],
                       ),
                       SizedBox(width: 70,),
                       Stack(
                         alignment: Alignment.center,
                         children: [
                           SizedBox(
                             width: 90, // Adjust size as needed
                             height: 90, // Adjust size as needed
                             child: CircularProgressIndicator(
                               value: 0.43,
                               strokeWidth: 8, // Adjust thickness
                               color: Colors.white,
                               backgroundColor: Colors.white24,
                             ),
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 "43%", // Your text inside the indicator
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 22,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text("completed",style: TextStyle(color: Colors.white),)
                             ],
                           ),
                         ],
                       )
                     ],
                   ),
                  const SizedBox(height: 10),


                  const SizedBox(height: 10),
                  Row(

                    children: [
                      Icon(Icons.diamond_rounded,color: Colors.red,size: 35,),
                      Icon(Icons.diamond_rounded,color: Colors.red,size: 35,),

                      Text(
                        "  2 Milestones",
                        style: TextStyle(color: Colors.white),
                      ),

                      // Card(
                      //   color: Colors.white54,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(50),),
                      //   child: Padding(padding: EdgeInsets.all(18),
                      //     child: Text('43%',style: TextStyle(color: Colors.white),),),
                      // )
                      // CircularProgressIndicator(
                      //   value: 0.40,
                      //   color: Colors.white,
                      //   backgroundColor: Colors.white24,
                      // ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        _buildCourseCard("Basics", "4/5", Icons.book, Colors.orange,),
                        _buildCourseCard("Occupations", "1/5", Icons.work, Colors.red),
                        _buildCourseCard("Conversation", "3/5", Icons.chat, Colors.blue),
                        _buildCourseCard("Places", "1/5", Icons.place, Colors.green),
                        _buildCourseCard("Family members", "3/5", Icons.people, Colors.purple),
                        _buildCourseCard("Foods", "2/5", Icons.food_bank, Colors.indigo),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCourseCard(String title, String progress, IconData icon, Color color) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   backgroundColor: Colors.white,
            //   // backgroundColor: color.withOpacity(0.2),
            //   child: Icon(icon, color: color),
            // ),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread of the shadow
                    blurRadius: 6, // Softness of the shadow
                    offset: Offset(0, 3), // Offset (X, Y) - moves shadow down
                  ),
                ],
              ),
              child: Icon(icon, color: color),
            ),

            SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(progress, style: const TextStyle(color: Colors.grey)),
            // LinearProgressIndicator(color: color,
            // backgroundColor: Colors.white,)
            LinearProgressIndicator(
              value: _getProgressValue(progress), // Convert progress to a value between 0 and 1
              color: color,
              backgroundColor: Colors.grey.shade300, // Lighter background color for contrast
              minHeight: 5, // Adjust height for better visibility
              borderRadius: BorderRadius.circular(5), // Optional: smooth edges
            )

          ],
        ),
      ),
    );
  }
}

class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

double _getProgressValue(String progress) {
  List<String> parts = progress.split("/");
  if (parts.length == 2) {
    double completed = double.tryParse(parts[0]) ?? 0.0;
    double total = double.tryParse(parts[1]) ?? 1.0;
    return (completed / total).clamp(0.0, 1.0); // Ensures value stays in range
  }
  return 0.0; // Default value if format is wrong
}

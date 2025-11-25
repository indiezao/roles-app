import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 127, 218, 52)),
      ),
      home: const MyHomePage(title: 'Meu Rolê'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // Variaveis iniciais dos cartoes
  int cardCount = 10;
  int _currentPage = 0;


  // Cria as bolinhas de indicação dos cartoes
  List<Widget> _buildPageIndicators(){
    List<Widget> indicators = [];

    for (int i = 0; i < cardCount; i++) {
      indicators.add(
        _indicator(i == _currentPage)
      );
    }

    return indicators;
  }


  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,

      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

        Container(
          height: 280,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,

            controller: PageController(
              viewportFraction: 0.85,
              initialPage: 0
            ),

            itemCount: cardCount,


            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },


            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(16,64,16,0),

                decoration: ShapeDecoration(
                  color: const Color.from(alpha: 1, red: 0.541, green: 0.808, blue: 0),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 40,
                      cornerSmoothing: 0.8)
                  )
                ),

                padding: EdgeInsets.all(20),
                child: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize:32),
                )
              );
            }
          )
        ),


        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicators(),
        ),


        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 180
              )
            ]
          ),
        ]
      )
    );
  }
}

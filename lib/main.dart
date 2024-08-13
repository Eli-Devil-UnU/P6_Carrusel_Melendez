import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melendez Carrusel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const CarruselMotos(),
    );
  }
} //fin clase MyApp

class CarruselMotos extends StatefulWidget {
  const CarruselMotos({Key? key}) : super(key: key);

  @override
  State<CarruselMotos> createState() => _CarruselMotosState();
} //fin clase carrusel perros stateful

class _CarruselMotosState extends State<CarruselMotos> {
  late PageController _pageController;
  List<String> images = [
    "https://raw.githubusercontent.com/Eli-Devil-UnU/P6_Carrusel_Melendez/main/motos/Kawasaki_Ninja_H2r.jpg",
    "https://raw.githubusercontent.com/Eli-Devil-UnU/P6_Carrusel_Melendez/main/motos/chopper.jpg",
    "https://raw.githubusercontent.com/Eli-Devil-UnU/P6_Carrusel_Melendez/main/motos/dm200.jpg",
    "https://raw.githubusercontent.com/Eli-Devil-UnU/P6_Carrusel_Melendez/main/motos/mt09_2024.jpg",
    "https://raw.githubusercontent.com/Eli-Devil-UnU/P6_Carrusel_Melendez/main/motos/rc200.jpg"
  ];

  int activePage = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
            itemCount: images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  images[pagePosition],
                  fit: BoxFit.cover,
                ),
              );
            }),
      )
    ]);
  }
} //fin clase estado

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}

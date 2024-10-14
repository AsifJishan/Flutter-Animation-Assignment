import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anime(),
    );
  }
}

class Anime extends StatelessWidget {
  const Anime({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool clickMarche = false.obs;
    var akar = MediaQuery.of(context).size;

    return Obx(() => Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: akar.width,
            height: akar.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 355),
                  curve: Curves.easeOut,
                  top: clickMarche.value ? akar.width * .20 : 0,
                  left: clickMarche.value ? akar.width * .34 : 0,
                  child: GestureDetector(
                    onTap: () {
                      clickMarche.value = true;
                    },
                    child: Text(
                      clickMarche.value ? "Ripples" : "Expand",
                      style: TextStyle(
                        fontSize: akar.width * 0.08,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 355),
                  curve: Curves.easeOut,
                  top: clickMarche.value ? akar.width * .61 : akar.width * .76,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 355),
                    curve: Curves.easeOut,
                    width: clickMarche.value ? akar.width * .8 : akar.width * .46,
                    height: clickMarche.value ? akar.width * .8 : akar.width * .46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(clickMarche.value ? 60 : 100),
                      color: const Color(0xff999999),
                    ),
                    child: clickMarche.value
                        ? AnimatedOpacity(
                            duration: const Duration(milliseconds: 355),
                            opacity: clickMarche.value ? 1 : 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart, size: akar.width * .06,),
                                    Text(" Items in Cart", style: TextStyle(fontSize: akar.width * .05),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.history_toggle_off, size: akar.width * .06,),
                                    Text(" Purchase history", style: TextStyle(fontSize: akar.width * .05),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.settings_outlined, size: akar.width * .06,),
                                    Text(" App Settings", style: TextStyle(fontSize: akar.width * .05),)
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 355),
                  curve: Curves.easeOut,
                  top: clickMarche.value ? akar.width * 1.73 : akar.width * .8, // Adjust this value to move the circle
                  right: clickMarche.value ? 0 : akar.width * .29,
                  child: GestureDetector(
                    onTap: () {
                      clickMarche.value = false;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 355),
                      curve: Curves.easeOut,
                      width: clickMarche.value ? akar.width * .2 : akar.width * .38,
                      height: clickMarche.value ? akar.width * .2 : akar.width * .38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff4d4d4d),
                      ),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 121),
                        opacity: clickMarche.value ? 1 : 0,
                        child: Icon(Icons.rotate_left, size: akar.width * 0.1, color: Colors.white,),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 355),
                  curve: Curves.easeOut,
                  top: clickMarche.value ? 0 : akar.width * .84, // Adjust this value to move the circle
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 355),
                    curve: Curves.easeOut,
                    width: clickMarche.value ? akar.width * .2 : akar.width * .3,
                    height: clickMarche.value ? akar.width * .2 : akar.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

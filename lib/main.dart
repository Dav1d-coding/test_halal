import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomePage> {
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.green,
      body: CarouselSlider(
        disableGesture: true,
        carouselController: controller,
        options: CarouselOptions(
            scrollPhysics: NeverScrollableScrollPhysics(),
            height: MediaQuery.of(context).size.height,
            enableInfiniteScroll: false,
            onScrolled: null,
        ),
        items: [1,2,3,4].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.green
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.headphones_outlined, color: Colors.white,),
                            Container(
                              child: Column(
                                children: [
                                  Text("ProHalal", style: TextStyle(color: Colors.white, fontSize: 16),),
                                  Text("ПРОФЕССИОНАЛЬНО \nПРОВЕРЕННЫЙ \nХАЛЯЛЬ", style: TextStyle(color: Colors.white, fontSize: 16),)
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                      MainData(i: i, controller: controller),
                    ],
                  )
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class MainData extends StatefulWidget{
  final int i;
  final CarouselController controller;
  MainData({
    required this.i,
    required this.controller
  });

  @override
  State<StatefulWidget> createState() => MainDataState();
}

class MainDataState extends State<MainData>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(widget.i == 1){
      return Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              "Сомневаетесь в \nдозволенности продукта?",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            Text(
              "Тогда впишите его название в \nпоисковике",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text("Image"),
            Text(
              "И приложение тут же выдаст ответ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text("Image"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),
                onPressed: () => {
                  widget.controller.nextPage(duration: Duration(milliseconds: 500))
                },
                child: Text("Дальше", style: TextStyle(color: Colors.black38),)
            ),
          ],
        ),
      );
    }else if(widget.i == 2){
      return Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              "Для удобства работы со списком\nингредиентов есть разделение на\nстраницы продуктов и добавок",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text("Image"),
            SizedBox(height: 10,),
            Text("а также удобная\nсортировка и фильтрация",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),),
            Text("Image"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white
                ),
                onPressed: () => {
                  widget.controller.nextPage(duration: Duration(milliseconds: 500))
                },
                child: Text("Дальше", style: TextStyle(color: Colors.black38),)
            ),
          ],
        ),
      );
    }else if(widget.i == 3){
      return Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("Не знаете где поесть?", style: TextStyle(color: Colors.white, fontSize: 14),),
            SizedBox(height: 20,),
            Text("Тогда перейдите на страницу общепитов", style: TextStyle(color: Colors.white, fontSize: 14),),
            Text("Image"),
            SizedBox(height: 10,),
            Text("и выберите любое заведение из списка \nбез сомнений в дозволенности блюд", style: TextStyle(color: Colors.white, fontSize: 12),),
            Text("Image"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white
                ),
                onPressed: () => {
                  widget.controller.nextPage(duration: Duration(milliseconds: 500))
                },
                child: Text("Дальше", style: TextStyle(color: Colors.black38),)
            ),
          ],
        ),
      );
    }
    else{
      return Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              "Хотите помочь в развитии\nприложения?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20,),
            Text(
              "Перейдите в настройках на страницу\nобратной связи и выберите любой\nудобный вам способ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text("Image"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white
                ),
                onPressed: () => {
                  widget.controller.nextPage(duration: Duration(milliseconds: 500))
                },
                child: Text(
                  "Начать",
                  style: TextStyle(color: Colors.black38),)
            ),
          ],
        ),
      );
    }
  }

}

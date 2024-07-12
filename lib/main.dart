import 'dart:io';

import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'Student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 56, 161, 231)),
        useMaterial3: true,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
        Student("นายชาญณรงค์ แต่งเมือง", "643450069-6", "assets/images/1.jpg","channarong.ta@kkumail.com","ชื่อเล่นเจี๊ยบ นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/jiab.channarong.10"),
        Student("นางสาวนภัสสร ดวงจันทร์", "643450326-2", "assets/images/2.jpg","napatson.d@kkumail.com","ชื่อเล่นครีม นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/profile.php?id=100013366607167",),
        Student("นายเจษฏา พบสมัย", "643450323-8", "assets/images/3.jpg","chetsada.pho@kkumail.com","ชื่อเล่นแบงค์ นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/chetsada.phobsamai.9",),
        Student("นายศรันย์ ซุ่นเส้ง", "643450086-6", "assets/images/4.jpg","saran.sun@kkumail.com","ชื่อเล่นมอส นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/profile.php?id=100012787714925",),
        Student("นายกมล จันบุตรดี", "643450063-8", "assets/images/5.jpg","kamom.j@kkumail.com","ชื่อเล่นเอก นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/profile.php?id=100008572876637",),
        Student("นายประสิทธิชัย จันทร์สม",  "643450079-3", "assets/images/6.jpg","prasittichai.j@kkumail.com","ชื่อเล่นฟาร์ นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/profile.php?id=100069065683019",),
        Student("นายก้องภพ ตาดี", "643450321-2", "assets/images/7.jpg","kongphop.t@kkumail.com","ชื่อเล่นโมเดล นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/kongphop.tadee",),
        Student("นางสาวสุธาดา เสนามงคล","643450089-0", "assets/images/8.jpg","suthada.s@kkumail.com","ชื่อเล่นเนย นักศึกษาปริญาตรีชั้นปีที่4 สาขาวิชาวิทยาการคอมพิวเตอร์และสารสนเทศ คณะสหวิทยาการ มหาวิทยาลัยขอนแก่น วิทยาเขตหนองคาย","https://www.facebook.com/hisuthada",),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List Student"),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return displayItem(context: context,student: datas[index]);
        }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.push(context, 
      //     MaterialPageRoute(builder: (context) => Detailpage()));
      //   },
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   child: const Icon(Icons.add),
      //   )
    );
  }

  Widget displayItem({required BuildContext context,required Student student}) {
    bool isHighlighted = student.name == "นายเจษฏา พบสมัย" && student.ids == "643450323-8";

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data: student)));
      },
      child: Container(
      padding: const EdgeInsets.all(10),
      color: isHighlighted ? Color.fromARGB(255, 56, 161, 231) : Colors.transparent,
      child: Row(
        children: [
          Hero(tag: student.ids , 
          child: 
          Image.asset(
            student.images,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          )),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                student.ids,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),)
    );
  }
}

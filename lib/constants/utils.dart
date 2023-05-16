import 'package:chamsoccaytrong/models/plant_model.dart';
import 'package:chamsoccaytrong/models/todo_work.dart';
import 'package:flutter/material.dart';

class Utils{
  Size getScreenSize(){
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }
}
// ---------------sẽ xoá sau--------------------------------------
const List<String> categoriesList = [
  "Prime",
  "Mobiles",
  "Fashion",
  "Electronics",
  "Home",
  "Fresh",
  "Appliances",
  "Books, Toys",
  "Essential"
];
const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];
const List<String> flowersList = [
  "Hoa cẩm chướng",
  "Hoa Lan",
  "Hoa Dãaaaaa aaaaaaa Quỳ 122222222222",
  "Hoa súng",
  "Hoa sen",
  "Hoa mamamam mamamam maamma mamama",
  "Hoa huệ",
  "Hoa mẫu đơn",
  "Hoa vạn thọ",
];
const List<String> flowersImages = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/White_and_yellow_flower.JPG/1280px-White_and_yellow_flower.JPG",
  "https://upload.wikimedia.org/wikipedia/commons/f/f5/Ophrys_apifera_flower1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/8/84/Clianthus_puniceus_%28Kaka_Beak%29_flowers.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/5/55/Acaena_novae-zelandiae1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Hura_crepitans_%28fruit%29.jpg/1280px-Hura_crepitans_%28fruit%29.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/5/52/Liliumbulbiferumflowertop.jpg",
  "https://e1.pxfuel.com/desktop-wallpaper/314/88/desktop-wallpaper-beautiful-flowers-in-full-bloom-android-phone-1080x1920-full-screen-size-android.jpg",
  "https://e0.pxfuel.com/wallpapers/955/232/desktop-wallpaper-android-full-screen-nature-more-at-android-full-screen-n-nature-android-nature-nature-nature-full-screen.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/2/2a/Misc_pollen_colorized.jpg",
];
List<PlantModel>plantModelList=[
  PlantModel(
    url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/White_and_yellow_flower.JPG/1280px-White_and_yellow_flower.JPG",
   name: "Hoa cẩm chướng",
    age: 12),
  PlantModel(url: "https://upload.wikimedia.org/wikipedia/commons/f/f5/Ophrys_apifera_flower1.jpg", 
  name: "Hoa Lan", 
  age: 25),
  PlantModel(url: "https://upload.wikimedia.org/wikipedia/commons/8/84/Clianthus_puniceus_%28Kaka_Beak%29_flowers.jpg", 
  name: "Hoa Dãaaaaa aaaaaaa Quỳ 122222222222", 
  age: 14),
  PlantModel(url: "https://upload.wikimedia.org/wikipedia/commons/5/55/Acaena_novae-zelandiae1.jpg", 
  name: "Hoa súng", 
  age: 28),
  PlantModel(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Hura_crepitans_%28fruit%29.jpg/1280px-Hura_crepitans_%28fruit%29.jpg", 
  name: "Hoa sen", 
  age: 18),
  PlantModel(url: "https://upload.wikimedia.org/wikipedia/commons/5/52/Liliumbulbiferumflowertop.jpg", 
  name: "Hoa mamamam mamamam maamma mamama", 
  age: 13),
  PlantModel(url: "https://e1.pxfuel.com/desktop-wallpaper/314/88/desktop-wallpaper-beautiful-flowers-in-full-bloom-android-phone-1080x1920-full-screen-size-android.jpg",
   name: "Hoa huệ", 
  age: 10),
  PlantModel(url: "https://e0.pxfuel.com/wallpapers/955/232/desktop-wallpaper-android-full-screen-nature-more-at-android-full-screen-n-nature-android-nature-nature-nature-full-screen.jpg", 
  name: "Hoa mẫu đơn", 
  age: 4),

  PlantModel(url: "https://upload.wikimedia.org/wikipedia/commons/2/2a/Misc_pollen_colorized.jpg", 
  name: "Hoa vạn thọ", 
  age: 22),
];

Map<int, TodoWork> todoWorkData = {
  0:TodoWork(jobName: "Tưới cây", time:"lúc 16:30", repetition:"Mỗi ngày một lần", setAlarm: true),
  1:TodoWork(jobName: "Tỉa lá", time:"lúc 16:40", repetition:"Hôm nay", setAlarm: false),
  2:TodoWork(jobName: "Bón phân", time:"", repetition:"Ngày 01/06/2023", setAlarm: true),
  3:TodoWork(jobName: "Bắt sâu", time:"lúc8:00", repetition:"3 ngày một lần", setAlarm: true),
  4:TodoWork(jobName: "Che nắng", time:"lúc 11:00", repetition:"Mỗi ngày một lần", setAlarm: false),
  5:TodoWork(jobName: "Xịt thuốc", time:"lúc 17:00", repetition:"Hàng tuần vào T5,CN", setAlarm: true),
  6:TodoWork(jobName: "Tưới cây 2", time:"lúc 16:30", repetition:"Mỗi ngày một lần", setAlarm: true),
  7:TodoWork(jobName: "Tỉa lá 2", time:"lúc 16:40", repetition:"Hôm nay", setAlarm: false),
  8:TodoWork(jobName: "Bón phân 2", time:"", repetition:"Ngày 01/06/2023", setAlarm: true),
  9:TodoWork(jobName: "Bắt sâu 2", time:"lúc8:00", repetition:"3 ngày một lần", setAlarm: true),
  10:TodoWork(jobName: "Che nắng 2", time:"lúc 11:00", repetition:"Mỗi ngày một lần", setAlarm: false),
  11:TodoWork(jobName: "Xịt thuốc 2", time:"lúc 17:00", repetition:"Hàng tuần vào T5,CN", setAlarm: true),
};

class Server {
  static List<TodoWork> getTodoWorkList() =>
      todoWorkData.values.toList();

  static TodoWork getTodoWorkByID(int id) {
    assert(id >= 0 && id <= 11);
    return todoWorkData[id]!;
  }
}
//-------------------------------------------------------------------
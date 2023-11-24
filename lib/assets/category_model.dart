import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageUrl;

  const Category({
    required this.name, 
    required this.imageUrl});

  @override
  List<Object> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: "El buen fin ya esta aqui", 
      imageUrl: "https://www.elfinanciero.com.mx/resizer/4GKpBQkND-BP2ksl2kj0jLwV8mI=/1440x810/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/elfinanciero/GCNOV2FFHBGBPFCMVMIPCLJB54.jpg"),
    const Category(
      name: "", 
      imageUrl: "https://www.papelerialacasadelpapel.com/newimages/pap/top.jpg"),
    const Category(
      name: "Nuestro local", 
      imageUrl: "https://img.uenicdn.com/image/upload/v1551792022/category/shutterstock_697823383.jpg"),
  ];
}

class Modal extends Equatable{
  final String name;
  final String desc;

  const Modal({
    required this.name, 
    required this.desc,});

  @override
  List<Object> get props => [name,desc];

  static List<Modal> modal = [
    const Modal(
      name: "assets/images/onboarding1.png", 
      desc: "123",), 
    const Modal(
      name: "assets/images/onboarding2.png",
      desc: "234",),
    const Modal(
      name: "assets/images/onboarding3.png",
      desc: "567",),
  ];
}
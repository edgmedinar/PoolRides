import 'dart:math';
import 'package:Pool_Rides/models/travel.dart';
import 'package:Pool_Rides/models/user.dart';

// ---------------------------------------------------
// --------------------- USERS -----------------------
// ---------------------------------------------------

List<User> users = [
  User(
    name: "Edgar Medina Rifas",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",
    image: "",
    age: 22,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Mauricio Durán Padilla",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
    image: "https://randomuser.me/portraits/men/2.jpg",
    age: 22,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Anahí Santana",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
    image: "https://randomuser.me/portraits/women/2.jpg",
    age: 23,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Martín Casillas",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
    image: "https://randomuser.me/portraits/men/2.jpg",
    age: 23,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Omar Soto",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",
    image: "https://randomuser.me/portraits/men/3.jpg",
    age: 21,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Fernando Franco",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
    image: "https://randomuser.me/portraits/men/6.jpg",
    age: 21,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Gustavo Rueda",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",
    image: "https://randomuser.me/portraits/men/4.jpg",
    age: 22,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
  User(
    name: "Salvador Gonzalez",
    biography:
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
    image: "https://randomuser.me/portraits/men/5.jpg",
    age: 22,
    travelsNumber: Random().nextInt(1000),
    reviewsNumber: Random().nextInt(1000),
    stars: (Random().nextDouble() * 4 + 1),
    joined: DateTime.now().subtract(Duration(days: Random().nextInt(1000))),
    reviews: null,
  ),
];

// ---------------------------------------------------
// --------------------- TRAVELS ---------------------
// ---------------------------------------------------

List<Travel> travels = [
  Travel(
    startTime: "3:00",
    arrivalTime: "5:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Chedraui, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[0],
    passengers: users.getRange(3, 7).toList(),
  ),
  Travel(
    startTime: "4:00",
    arrivalTime: "6:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[1],
    passengers: users.getRange(4, 6).toList(),
  ),
  Travel(
    startTime: "5:00",
    arrivalTime: "7:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[2],
    passengers: users.getRange(0, 2).toList(),
  ),
  Travel(
    startTime: "6:00",
    arrivalTime: "8:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[3],
    passengers: users.getRange(0, 1).toList(),
  ),
  Travel(
    startTime: "7:00",
    arrivalTime: "9:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[4],
    passengers: users.getRange(2, 4).toList(),
  ),
  Travel(
    startTime: "8:00",
    arrivalTime: "10:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[5],
    passengers: users.getRange(1, 2).toList(),
  ),
  Travel(
    startTime: "9:00",
    arrivalTime: "11:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[6],
    passengers: users.getRange(0, 2).toList(),
  ),
  Travel(
    startTime: "10:00",
    arrivalTime: "12:00",
    priceTravel: (Random().nextDouble() * 100 + 150),
    sourceName: "Guadalajara",
    destinyName: "Colima",
    sourceLocation: "Hotel Riu Plaza, Guadalajara Colón, San Pedro Tlaquepaque",
    destinyLocation: "Catedral Basílica Menor, Colima Centro, Colima Col",
    departureDate: DateTime.now().add(Duration(days: Random().nextInt(30))),
    driver: users[7],
    passengers: users.getRange(0, 1).toList(),
  ),
];

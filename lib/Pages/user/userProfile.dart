import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pool_rides/Pages/add-vehicle/addVehicle.dart';
import 'package:pool_rides/bloc/auth-bloc/auth_bloc.dart';
import 'package:pool_rides/bloc/user-bloc/user_bloc.dart';
import 'package:pool_rides/models/car.dart';
import 'package:pool_rides/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pool_rides/Pages/reviews/ReviewsPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pool_rides/services/auth-service.dart';

class UserProfile extends StatefulWidget {
  final User user;
  const UserProfile({Key key, @required this.user}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserBloc _userBloc;
  File selectedImage;
  bool existCar;
  Car userCar;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    if (widget.user.car != null) {
      existCar = true;
      userCar = widget.user.car;
    } else
      existCar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) {
          _userBloc = UserBloc();
          return _userBloc;
        },
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is ErrorState) {
              showErrorDialog(context, state);
            } else if (state is AccountNewImageState)
              selectedImage = state.image;
            else if (state is CarInformationState) {
              existCar = state.newCar;
              userCar = state.userCar;
            }
          },
          builder: (context, state) {
            return _userWidget(
              userBloc: _userBloc,
              selectedImage: selectedImage,
              user: widget.user,
              existCar: existCar,
              userCar: userCar,
            );

            // return Center(
            //   child: CircularProgressIndicator(),
            // );
          },
        ),
      ),
    );
  }

  Future showErrorDialog(BuildContext context, ErrorState state) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Parece que algo ha salido mal: '),
            content: Text('${state.errorEasy}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Aceptar"),
              )
            ],
          );
        });
  }

  Widget carInformation({
    @required Car car,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    car.model,
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${car.color}", // To Do: agregar el atributo "No. de reseñas en conductor"
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        car.image != ""
                            ? car.image
                            : "https://i.pinimg.com/originals/c0/0b/69/c00b692e9820c3970e907eae9bf2be25.png",
                      ),
                      maxRadius: 22.5,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 27.5,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  Widget _userWidget({
    @required UserBloc userBloc,
    @required selectedImage,
    @required user,
    @required existCar,
    @required userCar,
  }) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            CircleAvatar(
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage)
                  : NetworkImage(
                      UserAuthProvider().getPhotoUrl(),
                    ),
              maxRadius: 60.0,
              backgroundColor: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "${user.name}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "${user.age} años",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Cambia tu imagen de perfil'),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                        titlePadding: EdgeInsets.only(
                          top: 20.0,
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                  height: 50,
                                  color: Color.fromARGB(255, 51, 174, 250),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "¡Tomate una foto!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //bloc
                                    _userBloc
                                        .add(ChangeAccountImageByPhotoEvent());
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                  height: 50,
                                  color: Theme.of(context).primaryColor,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.camera,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Selecciona una foto",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //_userBloc
                                    _userBloc.add(
                                        ChangeAccountImageByGalleryEvent());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Aceptar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 20,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.face,
                      size: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Editar foto de perfil",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30,
              ),
              child: Text(
                "${user.biography}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                //TO DO: Ir hacia las reseñas de este usuario
                print(user.name);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewsPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${user.stars.toString().substring(0, 4)}/5 - ${user.reviewsNumber} reseña(s)", // To Do: agregar el atributo "No. de reseñas en conductor"
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 5,
              color: Colors.grey[500],
            ),
            SizedBox(
              height: 5,
            ),
            if (existCar) carInformation(car: userCar),
            GestureDetector(
              onTap: () async {
                var result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddVehiclePage(),
                  ),
                );
                if (result != null) {
                  //
                  print(result);
                  print(result[0]);
                  print(result[1]);
                  userBloc.add(LoadCarEvent());
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.car_repair,
                      size: 22.5,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      existCar ? "Cambiar auto" : "Añadir auto",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    "Usuario desde ${DateFormat.yMMMM().format(user.joined)}",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    BlocProvider.of<AuthBloc>(context).add(SignOutAuthEvent());
                  },
                  child: Text(
                    "Cerrar Sesión",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    // implement mapEventToState
    if (event is ChangeAccountImageByGalleryEvent) {
      try {
        dynamic response = await _pickImageGallery();
        if (response is String)
          yield ErrorState(
            error: response,
            errorEasy: "Algo salió mal al seleccionar la foto en galería :(",
          );
        else {
          File img = response;
          yield AccountNewImageState(image: img);
        }
      } catch (e) {
        yield ErrorState(
          error: e.toString(),
          errorEasy: "Algo salió mal al seleccionar la foto en galería :(",
        );
      }
    } else if (event is ChangeAccountImageByPhotoEvent) {
      try {
        dynamic response = await _pickImageCamera();
        if (response is String)
          yield ErrorState(
            error: response,
            errorEasy: "Algo salió mal al tomar la foto :(",
          );
        else {
          File img = response;
          yield AccountNewImageState(image: img);
        }
      } catch (e) {
        yield ErrorState(
          error: e.toString(),
          errorEasy: "Algo salió mal al tomar la foto :(",
        );
      }
    } else if (event is ChangeBiographyEvent) {
      yield ChangeBiographyState();
    }
  }
}

Future<dynamic> _pickImageGallery() async {
  final picker = ImagePicker();

  final PickedFile choosenImage = await picker.getImage(
    source: ImageSource.gallery,
    maxHeight: 720,
    maxWidth: 720,
    imageQuality: 85,
  );

  if (choosenImage.path == null) {
    return "Error";
  }
  return File(choosenImage.path);
}

Future<dynamic> _pickImageCamera() async {
  final picker = ImagePicker();
  final PickedFile choosenImage = await picker.getImage(
    source: ImageSource.camera,
    maxHeight: 720,
    maxWidth: 720,
    imageQuality: 85,
  );

  if (choosenImage.path == null) {
    return "Error";
  }
  return File(choosenImage.path);
}
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/drawing-shapes/shapes_bloc.dart';
import 'package:image_editor/presentation/bloc/imageINput/input_input_bloc.dart';
import 'package:image_editor/presentation/bloc/image_adjustment/image_adjust_bloc.dart';
import 'package:image_editor/presentation/bloc/text_editor/text_editor_bloc.dart';
import 'package:image_editor/presentation/screens/home_page.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageInputBloc>(create: (context) => ImageInputBloc()),
        BlocProvider(create: (context) => ImageAdjustmentBloc()),
        BlocProvider(create: (context) => DrawTextBloc()),
        BlocProvider(create: (context) => ShapeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

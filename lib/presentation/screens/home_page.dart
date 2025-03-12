import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_editor/presentation/bloc/imageINput/image_input_events.dart';
import 'package:image_editor/presentation/bloc/imageINput/image_input_state.dart';
import 'package:image_editor/presentation/bloc/imageINput/input_input_bloc.dart';
import 'package:image_editor/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:image_editor/presentation/bloc/navigation/navigation_event.dart';
import 'package:image_editor/presentation/bloc/navigation/navigation_state.dart';
import 'package:image_editor/presentation/screens/draw/draw_shapes.dart';
import 'package:image_editor/presentation/screens/image_adjustment/image_adjustment_page.dart';
import 'package:image_editor/presentation/screens/texts/draw_text.dart';
import 'package:image_editor/presentation/widgets/app_bar_widget.dart';
import 'package:image_editor/style/colors.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTheme.appBarWithDrawerAndNotification(
        context,
        'Notes',
      ),
      body: BlocBuilder<ImageInputBloc, ImageInputState>(
        builder: (context, state) {
          if (state is ImageInputInitial) {
            return const Center(child: Text('No image selected.'));
          } else if (state is ImageInputLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ImageInputSuccess) {
            return BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, NavigationState) {
                final List<Widget> pages = [
                  ImageEditor(image: File(state.imagePath).readAsBytesSync()),
                  ImageAdjustmentPage(imagePath: state.imagePath),
                  DrawText(imagePath: state.imagePath),
                  DrawShapesView(imagePath: state.imagePath),
                ];

                return Column(
                  children: [
                    Expanded(
                      child: IndexedStack(
                        index: NavigationState.selectedIndex,
                        children: pages,
                      ),
                    ),
                    BottomNavigationBar(
                      currentIndex: NavigationState.selectedIndex,
                      selectedItemColor: AppColors.onSurfaceColor,
                      unselectedItemColor: AppColors.onSurfaceColor,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.crop_square),
                          label: 'Crop',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.brightness_4),
                          label: 'Adjust',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.text_format),
                          label: 'Text',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.edit),
                          label: 'Draw',
                        ),
                      ],
                      onTap: (index) {
                        context.read<NavigationBloc>().add(
                          ChangeHomeIndex(index),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else if (state is ImageInputFailure) {
            return const Center(child: Text('Failed to load image.'));
          }
          return Container();
        },
      ),
      floatingActionButton: BlocBuilder<ImageInputBloc, ImageInputState>(
        builder: (context, state) {
          if (state is ImageInputInitial) {
            return FloatingActionButton(
              onPressed: () {
                context.read<ImageInputBloc>().add(
                  PickImage(source: ImageSource.gallery),
                );
              },
              child: const Icon(Icons.add_a_photo),
            );
          }
          return Container();
        },
      ),
    );
  }
}

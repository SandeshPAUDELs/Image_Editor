import 'package:flutter/material.dart';
import 'package:image_editor/style/colors.dart';

class CustomAppBarTheme {
  static AppBar appBarWithDrawerAndNotification(
    BuildContext context,
    String titleText,
  ) {
    return AppBar(
      backgroundColor: AppColors.surfaceColor,
      title: Text(titleText, style: Theme.of(context).textTheme.headlineMedium),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        Stack(
          children: [
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            Positioned(
              left: 22,
              top: 20,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: Text(
                  '1',
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

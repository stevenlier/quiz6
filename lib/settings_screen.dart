import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pilihan tema
            Text('Select Theme:', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 10),
            ...List.generate(3, (index) {
              return RadioListTile(
                title: Text('Theme ${index + 1}'),
                value: index,
                groupValue: themes.indexOf(themeProvider.currentThemeData),
                onChanged: (value) => themeProvider.changeTheme(value!),
              );
            }),
            SizedBox(height: 20),
            // Pilihan font
            Text('Select Font:', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 10),
            ...List.generate(3, (index) {
              return RadioListTile(
                title: Text(fonts[index]),
                value: index,
                groupValue: fonts.indexOf(themeProvider.currentFont),
                onChanged: (value) => themeProvider.changeFont(value!),
              );
            }),
          ],
        ),
      ),
    );
  }
}

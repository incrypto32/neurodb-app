import 'package:flutter/material.dart';
import 'package:neurodb/arch/architecture/view_builder.dart';
import 'package:neurodb/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = HomeViewModel();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ViewBuilder<HomeViewModel>(
          modelBuilder: (ctx) => homeViewModel,
          builder: (context, model, child) => Text(
            "${model.counter}",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeViewModel.updateCounter,
        child: Icon(Icons.plus_one),
      ),
    );
  }
}

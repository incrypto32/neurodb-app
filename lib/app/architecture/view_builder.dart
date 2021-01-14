import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ViewBuilder<T extends ViewModel> extends StatelessWidget {
  ViewBuilder(
      {@required this.modelBuilder, this.child, @required this.builder});
  ChangeNotifier Function(BuildContext) modelBuilder;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Widget child;
  ViewModel vm;

  bool _isValueBased = false;

  ViewBuilder.value({@required this.builder, this.child, @required this.vm}) {
    _isValueBased = true;
  }

  @override
  Widget build(BuildContext context) {
    if (_isValueBased) {
      return ChangeNotifierProvider<T>.value(
        value: vm,
        builder: (context, child) => Consumer<T>(
          builder: builder,
          child: child,
        ),
      );
    }

    return ChangeNotifierProvider<T>(
      create: modelBuilder,
      builder: (context, _) => Consumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}

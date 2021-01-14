import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_builder.dart';
import 'package:neurodb/ui/views/search/search_view_model.dart';
import 'package:neurodb/ui/widgets/gradient_scaffold.dart';
import 'package:neurodb/ui/widgets/search_text_field.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: ViewBuilder<SearchViewModel>(
          modelBuilder: (ctx) => SearchViewModel(context),
          builder: (context, vm, child) {
            return ListView(
              children: [
                Builder(builder: (context) {
                  return SearchTextField(
                    icon: Icon(Icons.search),
                    hintText: "Search Patients",
                    onChanged: (val) {},
                    onFilterTapped: () {
                      vm.showFilterDialog(context);
                    },
                  );
                }),
              ],
            );
          }),
    );
  }
}

import 'package:cooking/features/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:cooking/features/recipe/presentation/widgets/recipe_error_message_widget.dart';
import 'package:cooking/features/recipe/presentation/widgets/recipe_list_widget.dart';
import 'package:cooking/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cooking",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<RecipeBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RecipeBloc>()..add(GetRecipeList()),
      child: Container(
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            return Stack(
              children: <Widget>[
                RecipeListWidget(state),
                Visibility(
                  visible: (state is Error),
                  child: ErrorMessage(state is Error ? state.message : ""),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier_states.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/groceries_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryBodyWidget extends ConsumerWidget {
  const GroceryBodyWidget({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(groceriesProvider);
    return Stack(alignment: Alignment.center,children: [
      Builder(builder: (context) {
        if(state is GroceryInitialState){
      return ListView();
    }else if(state is GroceryLoadingState || state is GroceryUpdateDialogState){
      // Returning listview with cahced list just to igonre these states
      return GroceriesList(groceries: ref.read(groceriesProvider.notifier).groceries);      
    }else if(state is GroceryLoadedState){
      return GroceriesList(groceries: state.list);
    }
    return const Text('Something went wrong');
      },),
      const GroceryLoadingWidget(),
    ],);
  }
}

class GroceryLoadingWidget extends ConsumerWidget {
  const GroceryLoadingWidget({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(groceriesProvider);
    if(state is GroceryLoadingState){
      return const CupertinoActivityIndicator();
    }
    return const SizedBox();
  }
}
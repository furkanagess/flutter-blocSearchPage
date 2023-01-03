import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx_learn/product/constants/image_enums.dart';
import 'package:mobx_learn/travel/model/travel_model.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelLoading());
  List<TravelModel> allitems = [];
  Future<void> fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    allitems = TravelModel.mockItems;
    emit(TravelItemsLoaded(allitems));
  }

  void searchByItems(String data) {
    final result =
        allitems.where((element) => element.title.contains(data)).toList();
    emit(TravelItemsLoaded(allitems));
  }

  void seeAllItems() {
    emit(TravelItemsSeeAll([
      ImageEnums.eiffel_tower.toPath,
      ImageEnums.burj_khalifa.toPath,
      ImageEnums.machu_pichu.toPath,
    ]));
  }
}

abstract class TravelStates {}

class TravelLoading extends TravelStates {}

class TravelItemsLoaded extends TravelStates {
  final List<TravelModel> items;

  TravelItemsLoaded(this.items);
}

class TravelItemsSeeAll extends TravelStates {
  final List<String> images;

  TravelItemsSeeAll(this.images);
}

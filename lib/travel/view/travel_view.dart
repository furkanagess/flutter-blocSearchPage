import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx_learn/product/padding/page_padding.dart';
import 'package:mobx_learn/travel/cubit/travel_cubit.dart';
import 'package:mobx_learn/travel/model/travel_model.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final seeAll = "See All";
  final popularDest = "Popular destinations near you";
  final opening = "Hey Jhon! \n Where do you want to go today?";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelCubit>(
      create: (context) => TravelCubit()..fetchItems(),
      child: BlocConsumer<TravelCubit, TravelStates>(
        // Bloc / Cubit
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const PagePadding.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeadline(context),
                  context.emptySizedHeightBoxLow,
                  buildTextField(context),
                  context.emptySizedHeightBoxLow,
                  buildRowText(context),
                  SizedBox(
                    height: context.dynamicHeight(0.25),
                    child: buildItemListView(state),
                  ),
                  Expanded(
                    child: buildImageListView(state),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Text buildHeadline(BuildContext context) {
    return Text(
      opening,
      style: context.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  TextField buildTextField(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          // sorting with cubit
          context.read<TravelCubit>().searchByItems(value),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined),
        border: OutlineInputBorder(),
      ),
    );
  }

  Row buildRowText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          popularDest,
          style: context.textTheme.subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () => context.read<TravelCubit>().seeAllItems(),
          child: Text(
            seeAll,
            style: context.textTheme.subtitle1
                ?.copyWith(color: context.colorScheme.error),
          ),
        )
      ],
    );
  }

  ListView buildImageListView(TravelStates state) {
    return ListView.builder(
      itemCount: state is TravelItemsSeeAll ? state.images.length : 0,
      itemBuilder: (context, index) {
        final image = (state as TravelItemsSeeAll).images[index];
        return Image.asset(image);
      },
    );
  }

  Widget buildItemListView(TravelStates state) {
    return BlocSelector<TravelCubit, TravelStates, List<TravelModel>>(
      selector: (state) {
        return state is TravelItemsLoaded
            ? state.items
            : context.read<TravelCubit>().allitems;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount:
              // cubit
              state.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Card(
            child: SizedBox(
              width: context.dynamicWidth(0.35),
              child: Image.asset(TravelModel.mockItems[index].imagePath),
            ),
          ),
        );
      },
    );
  }
}

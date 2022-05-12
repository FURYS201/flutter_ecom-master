import 'dart:math';

import 'package:apptest/bloc/quantity_detail/cubit/quantity_detail_cubit.dart';
import 'package:apptest/bloc/quantity_detail/quantity_detail_bloc.dart';
import 'package:apptest/bloc/quantity_detail/quantity_detail_event.dart';
import 'package:flutter/material.dart';
import 'package:apptest/components/rounded_icon_btn.dart';
import 'package:apptest/models/ColorProduct.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  // late QuantityDetailBloc _quantityDetailBloc;
  // int _counter = 0;
  bool isVisible = false;
  // Now this is fixed and only for demo
  int selectedColor = 3;

  @override
  Widget build(BuildContext context) {
    // _quantityDetailBloc = BlocProvider.of<QuantityDetailBloc>(context);
    return BlocBuilder<QuantityDetailCubit, int>(builder: (context, count) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            ...List.generate(
              demoProducts.length,
              (index) => ColorDot(
                color: demoProducts[index].colors[index],
                isSelected: index == selectedColor,
              ),
            ),
            Spacer(),
            Visibility(
                visible: isVisible,
                child: RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {
                    context.read<QuantityDetailCubit>().decrement();
                    if (count <= 1) {
                      isVisible = false;
                    }
                  },
                )),
            SizedBox(width: getProportionateScreenWidth(10)),
            Text('$count', style: Theme.of(context).textTheme.headline5),
            SizedBox(width: getProportionateScreenWidth(10)),
            RoundedIconBtn(
              icon: Icons.add,
              showShadow: true,
              press: () {
                context.read<QuantityDetailCubit>().increment();
                if (count >= 0) {
                  isVisible = true;
                }
              },
            ),
          ],
        ),
      );
    });
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

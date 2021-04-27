import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:kartal/kartal.dart';

class GameCard extends StatelessWidget {
  final GameModel? model;
  final VoidCallback? onPressed;

  const GameCard({Key? key, this.model, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Card(
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(child: Image.network(model!.image!)),
              ),
              Text(model!.name!),
              Text('\$ ${model!.money}'),
            ],
          ),
        ),
      ),
    );
  }
}

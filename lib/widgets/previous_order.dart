import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class OrderPast extends StatelessWidget {
  const OrderPast({
    this.date,
    this.sumPast,
    this.nameOrderPast,
    this.priceOrderPast,
    this.quantityOrderPast,
    Key key,
  }) : super(key: key);

  final String date;
  final double sumPast;
  final String nameOrderPast;
  final double priceOrderPast;
  final int quantityOrderPast;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      initialElevation: 4.0,
      initialPadding: EdgeInsets.all(8.0),
      finalPadding: EdgeInsets.all(8.0),
      shadowColor: Colors.black,
      baseColor: Colors.white,
      expandedColor: Colors.white,
      title: Text(
        date,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text(
        sumPast.toString(),
        style: TextStyle(
            color: Colors.red, fontSize: 24, fontWeight: FontWeight.w500),
      ),
      children: [
        Divider(
          thickness: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(nameOrderPast),
                          Text(
                            priceOrderPast.toString(),
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Кол: ',
                          style: TextStyle(color: Colors.red),
                          children: [
                            TextSpan(
                              text: quantityOrderPast.toString(),
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      print('Look for order history');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.refresh,
                          color: Colors.red,
                          size: 28,
                        ),
                        Text('Заказать', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

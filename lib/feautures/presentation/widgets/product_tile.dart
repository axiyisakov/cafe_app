import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

typedef OnProductUpdated = void Function();

class ProductTile extends StatelessWidget {
  final Product product;
  final OnProductUpdated onCountIncreaesed;
  final OnProductUpdated onCountDecreased;
  const ProductTile({
    super.key,
    required this.product,
    required this.onCountIncreaesed,
    required this.onCountDecreased,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CupertinoListTile(
        title: Text(
          product.title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onCountIncreaesed,
              icon: const Icon(Icons.add),
            ),
            const Gap(10),
            Text(
              product.count.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Gap(10),
            IconButton(
              onPressed: onCountDecreased,
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

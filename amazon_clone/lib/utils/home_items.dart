import 'package:amazon_clone/pages/product_screen.dart';
import 'package:amazon_clone/utils/models.dart';
import 'package:flutter/material.dart';

class HomeItems extends StatelessWidget {
  final ProductModels productModels;
  const HomeItems({super.key,required this.productModels});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              product: productModels
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding:const EdgeInsetsDirectional.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(productModels.url)
                  ],
                ),
                
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModels.productname,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                
              ),

              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModels.cost.toString(),
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}

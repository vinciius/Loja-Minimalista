import 'package:flutter/material.dart';
import 'package:sneakerv1/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // shoe picture
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath)
            ),
          // description
          Container(
            margin: EdgeInsets.all(12),
            child: Text(
              shoe.description,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
          // price + details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // shoe name
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(shoe.name)),
                  // shoe price
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(shoe.price)),
                ],
              ),
              // sizedbox
              SizedBox(height: 20, width: 65,),

              // minus button
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)
                    ),
                  ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),

              // add button
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)
                    ),
                  ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          )
          // button to add to cart
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

 class ProductContainer extends StatelessWidget {

  // this called composition
  final ProductModel pro;

  const ProductContainer({ super.key,required this.pro});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248.51,
      width: 173.32,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border.all(color: Color(0xff7C7C7C)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              pro.image,
              width: 99.89,
              height: 79.43,
            ),
          ),
          SizedBox(height: 30),

          Text(
             pro.titel,
            style: TextStyle(
              fontWeight: FontWeight(600),
              fontSize: 16,
              color: Color(0xff181725),
            ),
          ),

          Expanded(
            child: Text(
              pro.des,
              style: TextStyle(
                fontWeight: FontWeight(400),
                fontSize: 14,
                color: Color(0xff7C7C7C),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                "\$${pro.price}",
                style: TextStyle(
                  fontWeight: FontWeight(600),
                  fontSize: 16,
                  color: Color(0xff181725),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 43),

              Container(
                height: 45.67,
                width: 45.67,

                decoration: BoxDecoration(
                  color: Color(0xff53B175),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(Icons.add, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


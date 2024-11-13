

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ufs_task/using%20http/screens/home/widget/ProductTile.dart';

import '../../controller/productController.dart';
import '../details/product_details.dart';

void main(){
  runApp(MaterialApp(home: Product_Main(),));
}
class Product_Main extends StatelessWidget {
  ProductController productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("shop Me!!"),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Column(
        children: [
          Text("shop your favourite",style: GoogleFonts.gelasio(fontSize: 28,fontWeight: FontWeight.bold),
          ),
          Expanded(child: Obx(() {
            if(productController.isLoading.value){
              return Center(
                child: Lottie.asset("assets/animation/shp.json"),
              );
            }else{

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: .6),
                  itemBuilder: (context,index) {
                    return InkWell(
                        onTap: ()=>Get.to(ProductDetailss(productController.productList[index])),
                        child: ProductTile(productController.productList[index]));



                  });
            }
          }))


        ],
      ),
    );
  }
}

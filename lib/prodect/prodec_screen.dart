import 'package:api/prodect/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ProdectScreen extends StatelessWidget {
  ProdectScreen({Key? key}) : super(key: key);
  final ProdectController controller = Get.put(ProdectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: Colors.white60,
                      highlightColor: Colors.grey.shade400,
                      child: Container(
                        width: 180,
                        height: 160,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: controller.products.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final model = controller.products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 6.0,
                      shadowColor: Colors.teal,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.network(
                                    model.image ?? '',
                                    width: 90,
                                    height: 130,
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.title ?? '',
                                        style: GoogleFonts.amaranth(
                                            fontSize: 8,
                                            color: Colors.teal.shade600),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        model.description ?? '',
                                        style: GoogleFonts.alef(
                                          fontSize: 7,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        model.rating.toString(),
                                        style: GoogleFonts.acme(
                                            fontSize: 8, color: Colors.grey),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            model.category ?? '',
                                            style: GoogleFonts.alata(
                                              fontSize: 8,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(
                                    fontSize: 8,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  model.price.toString(),
                                  style: GoogleFonts.alike(
                                    color: Colors.teal.shade600,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}

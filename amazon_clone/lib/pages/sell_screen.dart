import 'package:amazon_clone/pages/search_screen.dart';
import 'package:amazon_clone/provider/user_details_provider.dart';
import 'package:amazon_clone/utils/button.dart';
import 'package:amazon_clone/utils/cloud_firestore.dart';
import 'package:amazon_clone/utils/text_field.dart';
import 'package:amazon_clone/utils/user_details_bar.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    cost.dispose();
    description.dispose();
    super.dispose();
  }

  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.greenAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
                      child: Image.asset(
                        'lib/images/Amazon_icon.png',
                        height: 50,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchScreen()));
                            },
                            icon: const Icon(
                              Icons.notifications_none_outlined,
                              size: 28,
                            )),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ]),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      strokeWidth: 2,
                      color: Colors.blueGrey,
                      child: ClipRRect(
                        child: Container(
                          width: width / 3,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: image == null
                              ? Center(
                                  child: IconButton(
                                      onPressed: () async {
                                        Uint8List? temp =
                                            await Utils().pickImage();
                                        if (temp != null) {
                                          setState(() {
                                            image = temp;
                                          });
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.upload_outlined,
                                        size: 30,
                                        color: Colors.blueGrey,
                                      )),
                                )
                              : Stack(
                                  children: [
                                    Center(
                                      child: Image.memory(image!),
                                    ),
                                    Center(
                                      child: IconButton(
                                          onPressed: () async {
                                            Uint8List? temp =
                                                await Utils().pickImage();
                                            if (temp != null) {
                                              setState(() {
                                                image = temp;
                                              });
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.upload_outlined,
                                            size: 30,
                                            color: Colors.blueGrey,
                                          )),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Upload Images of the Product",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width / 1.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Product Details",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Name",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Textfield(
                            controller: name,
                            hintText: "Name of Product",
                            obstext: false),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Description",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                          child: TextField(
                            controller: description,
                            maxLines: 5,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey)),
                                fillColor: Colors.blueGrey[50],
                                filled: true,
                                hintText: "Product Description",
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Cost (in ₹)",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Textfield(
                            controller: cost, hintText: "Cost", obstext: false),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width - width / 1.2),
                    child: MyButton(
                        ontap: () async {
                          String output = await CloudFirestoreClass()
                              .uploadProducttoDatabase(
                                  image: image,
                                  description: description.text,
                                  productName: name.text,
                                  cost: cost.text,
                                  sellerName: Provider.of<UserDetailsProvider>(
                                          context,
                                          listen: false)
                                      .userdetails
                                      .name,
                                  sellerUid:
                                      FirebaseAuth.instance.currentUser!.uid);
                          if(output=="Success"){
                            Utils().showSnackBar(context: context, content: "Product Uploaded");
                            Navigator.pop(context);
                          }
                          else{
                            Utils().showSnackBar(context: context, content: output);
                          }
                        },
                        text: "Sell"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width - width / 1.2),
                    child: MyButton(
                        ontap: () {
                          Navigator.pop(context);
                        },
                        text: "Cancel"),
                  ),
                ],
              ),
            ),
          ),
          UserDetailsBar(
            offset: 0,
          ),
        ],
      ),
    );
  }
}

import 'package:amazon_clone/utils/button.dart';
import 'package:amazon_clone/utils/cart_items.dart';
import 'package:amazon_clone/utils/models.dart';
import 'package:amazon_clone/pages/search_screen.dart';
import 'package:amazon_clone/utils/user_details_bar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.greenAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Image.asset(
                  'lib/images/amazon.png',
                  height: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  child: Container(
                    width: width * 0.6,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blueGrey, width: 2),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.search,
                            size: 28,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: MyButton(ontap: () {}, text: "Proceed to buy"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return CartItems(
                    product: ProductModels(
                        cost: 1000,
                        productname: "Something very good",
                        sellername: "Keshto",
                        selleruid: "zmjjkk",
                        uid: "2k3r",
                        url:
                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                        description:"sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio jsdfgnivdn fndfngo fnignfnof nognfodngnofgnofnognn nn nnognfgonfo gnofn no n gonfdognfodn non fognfo ngon nosfdngonffognsodfngonfo nsnfognodfsngonsfon ndsofgnosfndognsfodngo sofdgnosdfngonfong nfodgn osfdn gon ",
                      ),
                  );
                },
              ),
            ),
          ],
        ),
        UserDetailsBar(
            offset: 0,
        )
      ]),
    );
  }
}

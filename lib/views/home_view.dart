import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/resources/json/local_json.dart';
import 'package:food_app/views/dashboard_view.dart';
import 'package:food_app/views/single_product_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../resources/custom-widgets/product_card_widget.dart';
import '../resources/custom-widgets/promotion_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int catSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Menu",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user-profile.jpg"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.onBackground.withOpacity(0.85),
            // const Color(0xffFBFAFF).withOpacity(0.85),
          ])),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              searchWidget(),

              // make here Categories

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: LocalJson.categoryList.length,
                    itemBuilder: (context, index) {
                      return categorieWidget(index, context);
                    }),
              ),
              Text(
                "Promotions",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              const SizedBox(
                height: 12,
              ),
              CarouselSlider(
                  items: carousalItem(),
                  options: CarouselOptions(
                    height: 100,
                    reverse: false,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                  )),

              const SizedBox(
                height: 12,
              ),
              Text(
                "Popular",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: LocalJson.productList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: SingleProductView(
                              image: LocalJson.productList[index]['image']
                                  .toString(),
                              price: LocalJson.productList[index]['price']
                                  .toString(),
                            ),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.slideUp,
                          );
                        },
                        child: ProductCardWidget(
                          productImage:
                              LocalJson.productList[index]['image'].toString(),
                          productName:
                              LocalJson.productList[index]['name'].toString(),
                          productPrice:
                              LocalJson.productList[index]['price'].toString(),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Reccomended",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: SingleProductView(
                                image: LocalJson.productList[index]['image']
                                    .toString(),
                                price: LocalJson.productList[index]['price']
                                    .toString(),
                              ),
                              withNavBar:
                                  false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.slideUp,
                            );
                          },
                          child: ProductCardWidget(
                            productImage: LocalJson.productList[index]['image']
                                .toString(),
                            productName:
                                LocalJson.productList[index]['name'].toString(),
                            productPrice: LocalJson.productList[index]['price']
                                .toString(),
                          ));
                    }),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container searchWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onTap: () {
          pushNewScreen(
            context,
            screen: const DashBoardView(
              initialValue: 1,
            ),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.slideUp,
          );
        },
        decoration: InputDecoration(
            suffixIcon: const Icon(CupertinoIcons.search),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSurface,
            contentPadding: const EdgeInsets.only(left: 20),
            hintText: "Search",
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  InkWell categorieWidget(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          catSelected = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: (catSelected == index)
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onSurface),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: (catSelected == index)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.onSurface,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                            LocalJson.categoryList[index]['image'].toString()),
                        fit: BoxFit.contain)),
              ),
            ),
            Text(
              LocalJson.categoryList[index]['name'].toString(),
              style: (catSelected == index)
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).primaryColor)
                  : Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> carousalItem() {
    return <Widget>[
      const PromotionCardWidget(
          image: "assets/images/products/beef-burger.png",
          firstLine: "Today's Offer",
          secundLine: "Free one burger",
          thirdLine: "on all orders above ₹150",
          gredintColor: [Color(0xff9577F2), Color(0xffA085F7)]),
      const PromotionCardWidget(
          image: "assets/images/categories/dessert.png",
          firstLine: "Today's Offer",
          secundLine: "Free one Dessert",
          thirdLine: "on all orders above ₹240",
          gredintColor: [Color(0xffB24592), Color(0xffF15F79)]),
      const PromotionCardWidget(
          image: "assets/images/products/pasta.png",
          firstLine: "Best Offer",
          secundLine: "Free pasta",
          thirdLine: "on all orders above ₹199",
          gredintColor: [Color(0xff4AC29A), Color(0xffBDFFF3)]),
    ];
  }
}

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppin_app/productPage.dart';
import 'package:shoppin_app/utils.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTabIndex = useState(0);
    final scrollController = useRef(ScrollController());
    final currentCarouselIndex = useValueNotifier(0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // selectedItemColor: The,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 12,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(color: Colors.grey.shade400, fontSize: 12),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,

        items: bottomNavigationItems(),
        currentIndex: currentTabIndex.value,
        onTap: (index) {
          currentTabIndex.value = index;
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: [
              // const SizedBox(height: 20),
              topSection(scrollController: scrollController.value),

              Expanded(
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: scrollController.value,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Column(
                            children: [
                              // Expanded(
                              //   child: CarouselSlider(
                              //     options: CarouselOptions(
                              //         autoPlay: true,
                              //         viewportFraction: 1,
                              //         aspectRatio: 2),
                              //     items: [
                              //       carouselItem(
                              //           backgroundImage: const AssetImage(
                              //               'assets/images/image_bg_2.png')),
                              //       carouselItem(
                              //           backgroundImage: const AssetImage(
                              //               'assets/images/image_bg_2.png'))
                              //     ],
                              //   ),
                              // ),

                              Expanded(
                                  child: CarouselSlider(
                                      items: [
                                    carouselItem(
                                        page: 1,
                                        backgroundImage: const AssetImage(
                                            'assets/images/image_bg_5.png')),
                                    carouselItem(
                                        page: 2,
                                        backgroundImage: const AssetImage(
                                            'assets/images/image_bg_4.png')),
                                  ],
                                      options: CarouselOptions(
                                          onPageChanged: (index, reason) {
                                            currentCarouselIndex.value = index;
                                          },
                                          autoPlay: true,
                                          aspectRatio: 2.1,
                                          viewportFraction: 1))),

                              // Expanded(
                              //   child: carouselItem(
                              //       backgroundImage: const AssetImage(
                              //           'assets/images/image_bg_2.png')),
                              // ),

                              Material(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    navButton(
                                        icon: const Icon(Icons.window),
                                        label: 'Category'),
                                    navButton(
                                        icon: const Icon(Icons.flight),
                                        label: 'Flight'),
                                    navButton(
                                        icon: const Icon(Icons.event_note),
                                        label: 'Bill'),
                                    navButton(
                                        icon: const Icon(Icons.blur_circular),
                                        label: 'Data plan'),
                                    navButton(
                                        icon: const Icon(Icons.monetization_on),
                                        label: 'Top Up'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: ValueListenableBuilder(
                                    valueListenable: currentCarouselIndex,
                                    builder: (context, value, child) =>
                                        CarouselIndicator(
                                            count: 2, index: value)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverStickyHeader(
                      header: stickyHeader(),

                      // header:
                      sliver: SliverList(
                          delegate: SliverChildListDelegate([
                        Container(
                          color: Colors.grey.shade200,
                          child: Column(
                            children: [
                              productRow(
                                labelLeft:
                                    "Essential Men's Short-Sleeve Crewneck T-Shirt",
                                labelRight:
                                    "Essential Womens's Long-Sleeve Caramel Wine Dress",
                                assetLeft: 'assets/images/shirt1.png',
                                assetRight: 'assets/images/shirt2.png',
                              ),
                              productRow(
                                labelLeft:
                                    "Essential Men's Regular-Fit Long-Sleeve Oxford",
                                labelRight:
                                    "Essential Men's Short-Sleeve Crewneck T-Shirt",
                                assetLeft: 'assets/images/shirt3.png',
                                assetRight: 'assets/images/shirt5.png',
                              ),
                              productRow(
                                labelLeft:
                                    "Essential Men's Regular-Fit Long-Sleeve Oxford",
                                labelRight:
                                    "Essential Men's Short-Sleeve Crewneck T-Shirt",
                                assetLeft: 'assets/images/shirt2.png',
                                assetRight: 'assets/images/shirt3.png',
                              ),
                              productRow(
                                labelLeft:
                                    "Essential Men's Regular-Fit Long-Sleeve Oxford",
                                labelRight:
                                    "Essential Men's Short-Sleeve Crewneck T-Shirt",
                                assetLeft: 'assets/images/shirt1.png',
                                assetRight: 'assets/images/shirt5.png',
                              ),
                              // productRow(),
                            ],
                          ),
                        )
                      ])),
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

  Widget stickyHeader() {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Best Sale Product',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See more',
                  style: TextStyle(color: secondaryColor),
                ))
          ],
        ),
      ),
    );
  }

  Widget carouselItem(
      {required AssetImage backgroundImage, required int page}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(.3),
          image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 80),
                  if (page == 1) ...[
                    const Text(
                      '#FASHION DAY',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                    ),
                    const Text('80% OFF',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700)),
                    const Text(
                      'Discover fashion that suits \nto your style',
                      style: TextStyle(fontSize: 10),
                    ),
                  ] else ...[
                    const Text(
                      '#BEAUTYSALE',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                    ),
                    // const Text('80% OFF',
                    //     style:
                    //         TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                    Text('Discover our \nbeautfy selection'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700)),
                  ],
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.grey.shade50),
                      child: const Text('Check this out')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navButton({required Widget icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                style: IconButton.styleFrom(
                    // minimumSize: const Size(10, 10),
                    // padding: const EdgeInsets.all(5),
                    ),
                onPressed: () {},
                icon: icon),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationItems() => [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined), label: 'Voucher'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.wallet_rounded), label: 'Wallet'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Settings'),
      ];

  Widget productRow({
    required String labelLeft,
    required String labelRight,
    required String assetLeft,
    required String assetRight,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: productCard(label: labelLeft, asset: assetLeft),
          ),
          const Spacer(flex: 1),
          Expanded(
              flex: 8, child: productCard(label: labelRight, asset: assetRight))
        ],
      ),
    );
  }

  Widget productCard({required String label, required String asset}) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const ProductPage()));
        },
        child: Stack(
          children: [
            Container(
              color: Colors.grey.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // margin: const EdgeInsets.only(right: 20),
                    width: MediaQuery.of(context).size.width * .45,
                    child: AspectRatio(
                        aspectRatio: 1.2,
                        child: Image.asset(
                          asset,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shirt',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        ),
                        Text(
                          label,
                          maxLines: 2,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                            Text('4.9|2356',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade500)),
                            const Spacer(),
                            Text('\$12.00',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.favorite_border),
            )
          ],
        ),
      );
    });
  }

  Widget topSection({required ScrollController scrollController}) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        double t = scrollController.hasClients
            ? clampDouble(scrollController.offset / 300, 0, .9)
            : 0;

        // print(t);
        return Container(
          color: Color.lerp(Colors.grey.shade300, Colors.white, t),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: textFieldDecoration(
                          hint: 'Search', prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 3),
                  child: putBadge(
                    badgeContent: '1',
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.folderOpen,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3, right: 6),
                  child: putBadge(
                    badgeContent: '9+',
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        // Icons.message,
                        FontAwesomeIcons.message,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

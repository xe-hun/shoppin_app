import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shoppin_app/utils.dart';

class ProductPage extends HookWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          topItem(backButton: () {
            Navigator.of(context).pop();
          }),
          Expanded(
              child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: .9,
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  color: Colors.grey.shade200,
                                  padding: const EdgeInsets.all(10),
                                  child:
                                      Image.asset('assets/images/shirt1.png'),
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 15),
                                        smallDisplay(),
                                        smallDisplay(),
                                        smallDisplay(),
                                        smallDisplay()
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Icon(
                                  Icons.account_balance_wallet_rounded,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'tokobaju.id',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade600),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          "Essentials Men's Short-Sleeve Crewneck T-Shirt",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              height: 1.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade800,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10),
                                  child: Text(
                                    '4.9 Ratings . 2.3k+Reviews . 2.9k + Sold',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].animate(interval: 100.ms).moveY(
                          begin: 60,
                          end: 0,
                          curve: Curves.easeOutCirc,
                          duration: 900.ms),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: TabBar(
                        indicatorColor: secondaryColor,
                        unselectedLabelColor: Colors.grey.shade600,
                        labelColor: secondaryColor,
                        labelStyle: const TextStyle(fontSize: 20),
                        controller: tabController,
                        tabs: [
                          buildTabLabel(label: 'About Item'),
                          buildTabLabel(label: 'Reviews')
                        ]),
                  ),
                )
              ];
            },
            body: TabBarView(controller: tabController, children: [
              aboutTab(),
              Container(
                height: 100,
                color: Colors.yellow,
              )
            ]),
          ))
        ]),
      ),
    );
  }

  Widget smallDisplay() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Image.asset('assets/images/shirt1.png'),
    );
  }

  Widget buildNavigationBar() {
    return Container(
      color: Colors.white,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    Text(
                      '\$18.00',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: secondaryColor),
                    )
                  ],
                )),
            Expanded(flex: 5, child: buyNowWidget())
          ],
        ),
      ),
    );
  }

  Widget buyNowWidget() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                color: secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet,
                      color: Colors.grey.shade50,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '1',
                      style: TextStyle(color: Colors.grey.shade50),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  color: Colors.grey.shade900,
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.grey.shade50),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildTabLabel({required String label}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label),
    );
  }

  Widget topItem({required Function() backButton}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 25, left: 12),
      child: Row(
        children: [
          IconButton(
              onPressed: backButton, icon: const Icon(Icons.arrow_back_ios)),
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
          putBadge(
              badgeContent: '1',
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.wallet_rounded))),
        ],
      ),
    );
  }

  Widget aboutTab() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 15),
            listItem(
                content:
                    'Long-sleeve chess shirt in classic fit function button-down collar'),
            listItem(content: 'Patch Pocket on Left Chest'),
            listItem(content: 'Durable Conbination Cotton Fabric'),
            listItem(content: 'Confortable and quality chess shirt'),
            listItem(
                content:
                    'Go To Classic button down shirt for all special occasions'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Chat us if there is anything you need to ask about the product :)',
                style: TextStyle(
                    color: Colors.grey.shade600, height: 1.5, fontSize: 15),
              ),
            ),
            Row(
              children: [
                Text(
                  'See less',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: secondaryColor),
                ),
                Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Colors.grey.shade400,
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Text(
              'Shippings Information:',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 20),
            info(label: 'Delivery', info: 'Shipping from Jakarta, Indonesia'),
            info(label: 'Shopping', info: 'FREE International Shipping'),
            info(
                label: 'Arrive', info: 'Estimated arrival on 25 - 27 Oct 2022'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Seller Information: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                storeIndicator(),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thrifting..Store',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Active 5 Min ago  |  96714 Positive FeedBack',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: secondaryColor, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: secondaryColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'View store',
                                style: TextStyle(color: secondaryColor),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Divider(thickness: 2),
            ),
            const Text(
              'Reviews & Ratings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(flex: 7, child: ratingsLeft()),
                  Expanded(flex: 9, child: ratingsRight())
                ],
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'Reviews with images & Videos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                reviewItemImage(),
                reviewItemImage(),
                reviewItemImage(),
                reviewItemImage()
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 2,
                color: Colors.grey.shade300,
              ),
            ),
            const Text(
              'Top Reviewes',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Row(
              children: [
                Expanded(
                    flex: 8,
                    child: Text(
                      'Showing 3 of 25k reviews',
                      style: TextStyle(color: Colors.grey.shade400),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade500),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                              child: Text(
                            'Popular',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            customerRater(
                name: 'Eren y*****r',
                comment:
                    'According to my speculation, this is the best thank you',
                rating: '5.0'),
            customerRater(
                rating: '4.2',
                name: 'Rainer b***e',
                comment: 'Best product of the centruy buy it.'),
            customerRater(
                rating: '3.3',
                name: 'Mikasa a*****n',
                comment: "This is the longest he's ever been"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      navButton(icon: const Icon(Icons.arrow_back_ios)),
                      pageNumber(number: '1'),
                      pageNumber(number: '2'),
                      pageNumber(number: '3'),
                      pageNumber(number: '....'),
                      navButton(icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
                Text(
                  'See more',
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ],
            ),
            const SizedBox(height: 70),
            Row(
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 15, color: secondaryColor),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: recommendationImage(asset: 'assets/images/shirt2.png'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: recommendationImage(asset: 'assets/images/shirt5.png'),
                )
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget recommendationImage({required String asset}) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  asset,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.grey.shade600,
                  ))
            ],
          )),
    );
  }

  Widget pageNumber({required String number}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        number,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget navButton({required Icon icon}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
      width: 38,
      height: 38,
      child: IconButton(onPressed: () {}, icon: icon),
    );
  }

  Widget tag() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: secondaryColor),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey.shade200, secondaryColor.withOpacity(.3)])),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        'Lorem ipsum donor evit ces ca lame',
        maxLines: 1,
        style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            overflow: TextOverflow.clip),
      ),
    );
  }

  Widget customerRater(
      {required String name, required String comment, required String rating}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.add_task_sharp),
            const SizedBox(width: 10),
            Text(name),
            const Spacer(),
            ratingStar(),
            Text(rating),
            const Icon(Icons.more_horiz)
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(flex: 8, child: tag()),
            Expanded(flex: 6, child: tag()),
            Expanded(flex: 6, child: tag()),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          comment,
          style: const TextStyle(
              fontWeight: FontWeight.w600, height: 1.5, fontSize: 14),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }

  SizedBox reviewItemImage() {
    return SizedBox(
      height: 70,
      width: 70,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/shirt1.png')),
    );
  }

  Stack storeIndicator() {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.shade300),
          child: const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Thinking Store',
              style: TextStyle(height: 1, fontWeight: FontWeight.w700),
            ),
          )),
        ),
        Positioned(
            bottom: 10,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.shade500),
              height: 15,
              width: 15,
            ))
      ],
    );
  }

  Widget info({required String info, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label :',
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              info,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem({required String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Icon(
            Icons.circle,
            size: 8,
            color: Colors.grey.shade500,
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Text(
            content,
            style: TextStyle(
                height: 1.4, fontSize: 15, color: Colors.grey.shade600),
          ),
        ))
      ],
    );
  }

  Widget reviewTab() {
    return Container(
      child: const Center(
        child: Text('Reviews'),
      ),
    );
  }

  Widget ratingsLeft() {
    return SizedBox(
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('4.9 ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35)),
              Text(
                '/ 5.0',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              )
            ],
          ),
          Row(
            children: [
              ratingStar(),
              ratingStar(),
              ratingStar(),
              ratingStar(),
              ratingStar(),
            ],
          ),
          const Spacer(),
          Text(
            '2.5k + Reviews',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          )
        ],
      ),
    );
  }

  Icon ratingStar() {
    return Icon(
      Icons.star,
      color: Colors.yellow.shade700,
      size: 25,
    );
  }

  Widget ratingsRight() {
    return Column(
      children: [
        ratingProgressWidget(rating: 5, qty: '15k'),
        ratingProgressWidget(rating: 4, qty: '710'),
        ratingProgressWidget(rating: 3, qty: '140'),
        ratingProgressWidget(rating: 2, qty: '10'),
        ratingProgressWidget(rating: 1, qty: '4'),
      ],
    );
  }

  Widget ratingProgressWidget({required String qty, required int rating}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          ratingStar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(rating.toString()),
          ),
          Expanded(
              flex: 4,
              child: SizedBox(
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    color: secondaryColor,
                    value: rating / 6,
                  ),
                ),
              )),
          const SizedBox(width: 5),
          SizedBox(
            width: 30,
            child: Text(
              qty,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/Ecommerce/const.dart';
import 'package:first_project/Ecommerce/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchBanners();
    context.read<HomeCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _homeBanner(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.popular_pack,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cubit = context.read<HomeCubit>();
                  final productList = cubit.productModel.data?.products;
                  if (state is HomeProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 210,
                    child: ListView.separated(
                      itemCount: productList?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                      itemBuilder: (context, index) => Container(
                        width: 180,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.network(
                                  productList?[index].image ?? ""),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    productList?[index].name ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    productList?[index].description ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  productList![index].price != null
                                      ? "\$ ${productList[index].price!}"
                                      : "0",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                // Text(
                                //   "\$50",
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //     color: Colors.grey,
                                //     decoration: TextDecoration.lineThrough,
                                //   ),
                                // ),
                                Spacer(),
                                FloatingActionButton(
                                  mini: true,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  shape: const CircleBorder(),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Our New Items",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 210,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemBuilder: (context, index) => Container(
                    width: 180,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0bETjmjHihMX-mFOiv9lpcJ_Xv9AuS1dU_A&s"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Bundle Pack",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Onion,Oil,Salt...",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "\$35",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "\$50",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Spacer(),
                            FloatingActionButton(
                              mini: true,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              shape: const CircleBorder(),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeBanner() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final bannerImages = context.read<HomeCubit>().bannerImages;
        if (state is HomeBannerLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CarouselSlider(
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          items: bannerImages.map((i) {
            return Container(
              height: 180,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  i,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          if (locale == Locale("en")) {
            locale = Locale("ar");
            Get.updateLocale(locale);
          } else {
            locale = Locale("en");
            Get.updateLocale(locale);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset("assets/images/menu_icon.svg"),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Row(
          children: [
            SvgPicture.asset(imagesPath + "Location.svg"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 35,
                      color: Colors.green,
                    ),
                  ],
                ),
                Text(
                  "Cairo, 66445 st",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.search),
        )
      ],
    );
  }
}

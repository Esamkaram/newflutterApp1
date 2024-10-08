import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cach/cach_helper.dart';
import 'package:flutter_application_2/core/cach/cach_key.dart';
import 'package:flutter_application_2/core/functions/navicator.dart';
import 'package:flutter_application_2/core/widgets/custom_bottom_container.dart';
import 'package:flutter_application_2/core/widgets/custom_textform.dart';
import 'package:flutter_application_2/features/home/cubit/home_cubit.dart';
import 'package:flutter_application_2/features/home/model/offer_model.dart';
import 'package:flutter_application_2/features/home/widgets/category_item_widget.dart';
import 'package:flutter_application_2/features/login/cubit/login_cubit.dart';
import 'package:flutter_application_2/features/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home',
            ),
            actions: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              color: Colors.amberAccent,
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [Text('ShowDialoG')],
                              ),
                            ),
                          ));
                },
                child: const Stack(
                  children: [
                    Icon(
                      Icons.notifications_rounded,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      maxRadius: 5.0,
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.playlist_add_outlined),
            onPressed: () {},
          ),
          body: (state is! HomeLodingstate)
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CustomTextform(
                              lable: "search".tr(),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: CustomBottomContainer(
                              buIcon: Icons.search,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          // color: Colors.amberAccent,
                        ),
                        child:
                            //   PageView.builder(
                            //     physics: const BouncingScrollPhysics(),
                            //     controller: boardController,
                            //     itemBuilder: (context, index) =>
                            //         buildOfferImg(homeCubit.offerModel!.data![index]),
                            //     itemCount: homeCubit.offerModel!.data!.length,
                            //   ),
                            // ),
                            CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            initialPage: 2,
                            autoPlay: true,
                          ),
                          items: homeCubit.offerModel!.data!
                              .map((item) => Image.network('${item.iMG}'))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "matter".tr(),
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 150.0,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryItemWidget(
                                  model: homeCubit.matterModel!.data![index],
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5.0,
                                ),
                            itemCount: homeCubit.matterModel!.data!.length),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
          drawer: Drawer(
            backgroundColor: Colors.blue[400],
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    child: CachedNetworkImage(
                        imageUrl: CacheHelper.getDate(
                                key: ChachKey.userImage) ??
                            'https://img.freepik.com/premium-photo/managing-user-permissions-roles-ecommerce-platforms_1104763-19809.jpg'),
                  ),
                  InkWell(
                    onTap: () async {
                      await CacheHelper.removeDate(key: ChachKey.userToken);
                      context.pushAndRemoveUntil(BlocProvider(
                        create: (context) => LoginCubit(),
                        child: const LoginScreen(),
                      ));
                    },
                    child: Container(
                      child: const Text(
                        'LogOut',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildOfferImg(OfferItem model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network('${model.iMG}'),
          ),
        ],
      );
}

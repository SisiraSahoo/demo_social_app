import 'package:demo_social_app/pages/dashboard/add_post/add_post_page.dart';
import 'package:demo_social_app/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:demo_social_app/pages/dashboard/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo_social_app/app_configs/app_assets.dart';
import 'package:demo_social_app/pages/dashboard/profile/profile_page.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  static const routeName = '/';

  const DashboardPage({Key? key}) : super(key: key);

  // int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(ProfilePage.routeName);
            },
            icon: const Icon(Icons.person),
            color: Colors.white,
          )
        ],
      ),
      body: controller.obx(
        (state) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemBuilder: (BuildContext context, int index) {
            return PostCard(state: state![index]);
          },
          itemCount: state!.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddPostPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

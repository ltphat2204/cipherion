import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:music_lyrica/features/music/controllers/navigation_menu_controller.dart';

class NavigationMenu extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) =>
              navigationController.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/home.png',
                color: Colors.white,
                height: 23,
                width: 23,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/search.png',
                color: Colors.white,
                height: 23,
                width: 23,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/album2.png',
                color: Colors.white,
                height: 23,
                width: 23,
              ),
              label: '',
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/dimond.png',
                color: Colors.white,
                height: 24,
                width: 24,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: Obx(() => navigationController
          .screens[navigationController.selectedIndex.value]),
    );
  }
}

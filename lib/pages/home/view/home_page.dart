import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_screen_test/common/ui/color.dart';
import 'package:one_screen_test/pages/home/bloc/home_bloc.dart';
import 'package:one_screen_test/pages/home/view/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  int screenIndex = 0;
  final List<Screen> screens = [
    Screen(
      title: 'Home',
      screen: const HomeView(),
      icon: const Icon(
        Icons.home_outlined,
      ),
    ),
    Screen(
      title: 'Calls',
      screen: const Center(child: Text('calls')),
      icon: const Icon(
        Icons.phone_outlined,
      ),
    ),
    Screen(
      title: 'Messages',
      screen: const Center(child: Text('messages')),
      icon: const Icon(
        Icons.message_outlined,
      ),
    ),
    Screen(
      title: 'Contacts',
      screen: const Center(child: Text('contacts')),
      icon: const Icon(
        Icons.person_outlined,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    homeBloc = HomeBloc();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  void _selectScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: homeBloc,
      child: Scaffold(
        body: SafeArea(
          child: screens[screenIndex].screen,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.baseBackground,
          currentIndex: screenIndex,
          unselectedItemColor: AppColors.lightMain,
          selectedItemColor: AppColors.main,
          showUnselectedLabels: true,
          onTap: _selectScreen,
          elevation: 0,
          items: [
            for (var screen in screens)
              BottomNavigationBarItem(
                icon: screen.icon,
                label: screen.title,
              ),
          ],
        ),
      ),
    );
  }
}

class Screen {
  final String title;
  final Widget screen;
  final Icon icon;

  Screen({
    required this.title,
    required this.screen,
    required this.icon,
  });
}

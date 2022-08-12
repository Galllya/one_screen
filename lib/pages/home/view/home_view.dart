import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_screen_test/common/ui/color.dart';
import 'package:one_screen_test/common/widgets/icon_button_custom.dart';
import 'package:one_screen_test/pages/home/bloc/home_bloc.dart';
import 'package:one_screen_test/pages/home/widgets/country_container.dart';
import 'package:one_screen_test/pages/home/widgets/custom_container.dart';
import 'package:one_screen_test/pages/home/widgets/number_strip.dart';
import 'package:one_screen_test/pages/home/widgets/type_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final textController = TextEditingController();
  List<String> type = [
    'Landling or Mobile',
    'Type 2',
    'Type 3',
    'Type 4',
  ];
  List<bool> connentDevice = [true, false, true];
  bool isSelect = true;
  late String dropDownValue;
  @override
  void initState() {
    dropDownValue = type.first;
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/237/200/300',
                    ),
                  ),
                  Row(
                    children: const [
                      IconButtonCustom(
                        icon: Icon(Icons.bar_chart_rounded),
                      ),
                      IconButtonCustom(
                        icon: Icon(Icons.message_outlined),
                      ),
                      IconButtonCustom(
                        icon: Icon(Icons.notifications_none_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomContainer(
              content: Column(
                children: [
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Country name',
                      labelStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                      ),
                      icon: Icon(
                        Icons.search,
                        color: AppColors.main,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.main,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        TypeContainer(
                          isActive: connentDevice[0],
                          title: 'SMS',
                          onTab: () {
                            setState(() {
                              connentDevice[0] = !connentDevice[0];
                            });
                          },
                        ),
                        TypeContainer(
                          isActive: connentDevice[1],
                          title: 'MMS',
                          onTab: () {
                            setState(() {
                              connentDevice[1] = !connentDevice[1];
                            });
                          },
                        ),
                        TypeContainer(
                          isActive: connentDevice[2],
                          title: 'Voice',
                          onTab: () {
                            setState(() {
                              connentDevice[2] = !connentDevice[2];
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.main, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        underline: const SizedBox(),
                        hint: Text(
                          dropDownValue,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        items: type.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (String? val) {
                          setState(
                            () {
                              dropDownValue = val!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelect = !isSelect;
                      });
                    },
                    child: Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.main,
                            ),
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: isSelect
                                ? const Icon(
                                    Icons.check,
                                    size: 20,
                                  )
                                : const SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Show numbers without verification',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CountryContainer(
              countryName: 'United states',
              picName: 'USA',
            ),
            CustomContainer(
              content: Column(
                children: const [
                  NumberStrip(),
                  NumberStrip(),
                  NumberStrip(),
                ],
              ),
            ),
            const CountryContainer(
              countryName: 'United Kingdom',
              picName: 'ENG',
            ),
            CustomContainer(
              content: Column(
                children: const [
                  NumberStrip(),
                  NumberStrip(),
                  NumberStrip(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}

import 'package:baykot/classes/list/listAct.dart';
import 'package:baykot/classes/list/listInAct.dart';
import 'package:baykot/classes/string/string_class.dart';
import 'package:baykot/data/cubits/tap/tap_cubit.dart';
import 'package:baykot/view/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ActiveTab { active, inactive }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ActiveTab _selectedTab = ActiveTab.active;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final string = StringClass();

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subscription',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: h * 0.042,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Per month  48',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: h * 0.026,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: h * 0.070,
                    width: w * 0.112,
                    child: Image.asset(
                      'assets/icons/Vector.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Reminder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: h * 0.020,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: h * 0.135,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.1,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xff4CA1FE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: w * 0.28,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: h * 0.050,
                                  width: w * 0.083,
                                  child: Image.asset(
                                    string.listicon[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.020,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: h * 0.010,
                                  ),
                                  Text(
                                    string.listtext[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: h * 0.018,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    string.liatprice[index],
                                    style: TextStyle(
                                      color: const Color(0xff4A4A4A),
                                      fontSize: h * 0.018,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: h * 0.040,
          ),
          Container(
            height: 32,
            width: w * 0.732,
            decoration: BoxDecoration(
              color: const Color(0xff444444),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BlocBuilder<ClickCubit, int>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: string.gen.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ClickCubit>().tapIndex(index);
                        setState(() {
                          _selectedTab = index == 0
                              ? ActiveTab.active
                              : ActiveTab.inactive;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: (343 - 8) / string.gen.length,
                        decoration: BoxDecoration(
                          color: state == index
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          string.gen[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: state == index ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _selectedTab == ActiveTab.active
              ? ListActive(h: h, w: w, string: string)
              : ListInActive(h: h, w: w, string: string),
        ],
      ),
    );
  }
}

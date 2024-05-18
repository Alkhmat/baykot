import 'dart:io';

import 'package:baykot/data/cubits/photo_picker/image_cubit.dart';
import 'package:baykot/widgets/auth/register/auth_fieled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _subscriptionDateController =
      TextEditingController();
  final TextEditingController _notecontroller = TextEditingController();
  final TextEditingController _siteurlcontrok = TextEditingController();
  final TextEditingController _costeController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  BlocBuilder<ImageCubit, ImageState>(
                    builder: (context, state) {
                      if (state is ImageInitial) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ImageCubit>().pickerPhoto();
                          },
                          child: CircleAvatar(
                            radius: h * 0.1,
                            backgroundColor: Colors.white70,
                            child: Center(
                                child: SizedBox(
                              height: 64,
                              width: 64,
                              child: Image.asset(
                                'assets/icons/add_photo.png',
                                fit: BoxFit.cover,
                              ),
                            )),
                          ),
                        );
                      } else if (state is ImageLoaded) {
                        return GestureDetector(
                          onTap: () {
                            context.read<ImageCubit>().reset();
                          },
                          child: CircleAvatar(
                            backgroundImage: FileImage(
                              File(state.images),
                            ),
                            radius: h * 0.1,
                            backgroundColor: Colors.white70,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        color: const Color(0xffC4C4C4),
                        fontSize: h * 0.042,
                        fontWeight: FontWeight.w600),
                  ),
                  Divider(
                    color: const Color(0xffC4C4C4),
                    height: h * 0.01,
                    endIndent: w * 0.4,
                    indent: w * 0.4,
                  )
                ],
              ),
              AuthTextFieled(
                h: h,
                controller: _costeController,
                labelText: 'Cost',
              ),
              SizedBox(
                height: h * 0.02,
              ),
              AuthTextFieled(
                h: h,
                labelText: 'Site URL',
                controller: _siteurlcontrok,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              AuthTextFieled(
                h: h,
                labelText: 'Note',
                controller: _notecontroller,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              AuthTextFieled(
                h: h,
                labelText: 'Subscription date',
                controller: _subscriptionDateController,
                onTap: () => _selectDate(context, _subscriptionDateController),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              AuthTextFieled(
                h: h,
                labelText: 'Expiration date',
                controller: _expirationDateController,
                onTap: () => _selectDate(
                  context,
                  _expirationDateController,
                ),
              ),
              SizedBox(
                height: h * 0.053,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.white10,
                  child: Ink(
                    height: h * 0.065,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff4CA1FE),
                          Color(0xff32338D),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Send me notifications',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: h * 0.020),
                      ),
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
}

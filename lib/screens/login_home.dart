import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kla_prototype/bloc/navigation/navigation_bloc.dart';
import 'package:kla_prototype/components/buttons/blue_button.dart';
import 'package:kla_prototype/components/buttons/yellow_button.dart';
import 'package:kla_prototype/components/dashline.dart';
import 'package:kla_prototype/components/scaffold.dart';
import 'package:kla_prototype/screens/role_selection.dart';
import 'package:kla_prototype/services/navigation/navigation.dart';
import 'package:kla_prototype/utils/constants.dart';
import 'package:kla_prototype/utils/spaces.dart';

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return CustomScaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 32,
              ),
            )
          ]),
        ),
        addVerticalSpace(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 0,
                    color: Colors.black,
                    offset: Offset(0, 0))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  addVerticalSpace(30),
                  Text(
                    'Hi there!',
                    style: themeData.textTheme.headline2!
                        .apply(color: c_GreenDark900),
                  ),
                  Text('How do you wish to continue?',
                      style: themeData.textTheme.headline6!
                          .apply(color: c_GreenDark900, fontWeightDelta: -1))
                ],
              ),
            ),
          ),
        ),
        addVerticalSpace(25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 0,
                  color: Colors.black,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        YellowButton(
                          'Log-in',
                          image: 'user.png',
                          onPressed: () {},
                        ),
                        addVerticalSpace(20),
                        YellowButton(
                          'Create account',
                          image: 'certificate.png',
                          onPressed: () {},
                        ),
                        addVerticalSpace(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: DashLineView(
                            fillRate: 0.3,
                            dashHeight: 3,
                            dashColor: c_Green100,
                          ),
                        ),
                        addVerticalSpace(15),
                        BlueButton(
                          'Try it out',
                          icon: Icons.arrow_forward_ios,
                          onPressed: () {
                            BlocProvider.of<NavigationBloc>(context).add(NavigateToEvent(context, RoleSelectionScreen()));
                          },
                        ),
                        addVerticalSpace(5),
                      ]),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

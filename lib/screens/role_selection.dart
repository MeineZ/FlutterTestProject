import 'package:flutter/material.dart';
import 'package:kla_prototype/bloc/navigation/navigation_bloc.dart';
import 'package:kla_prototype/bloc/roles/roles_bloc.dart';
import 'package:kla_prototype/components/buttons/yellow_button.dart';
import 'package:kla_prototype/components/role_item.dart';
import 'package:kla_prototype/components/scaffold.dart';
import 'package:kla_prototype/services/http/roles/api_roles.dart';
import 'package:kla_prototype/services/navigation/navigation.dart';
import 'package:kla_prototype/utils/constants.dart';
import 'package:kla_prototype/utils/spaces.dart';

import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionScreen extends StatefulWidget {
  GlobalKey<ScrollSnapListState> sslKey = GlobalKey();
  final RolesBloc rolesBloc = RolesBloc(ApiRoles());

  RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 3;
    requestRoles(5);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return CustomScaffold(
      body: BlocProvider(
        create: (context) => widget.rolesBloc,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<NavigationBloc>(context).add(NavigateBackEvent(context));
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 42,
                      color: Colors.white,
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '160 ',
                          style: themeData.textTheme.headline5!
                              .apply(color: Colors.white)),
                      const WidgetSpan(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 32,
                        ),
                        alignment: PlaceholderAlignment.middle,
                        baseline: TextBaseline.alphabetic,
                      ),
                    ]),
                  )
                ]),
          ),
          addVerticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: Container(
              width: 260,
              decoration: BoxDecoration(
                  color: c_GreenDark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  border: Border.all(color: c_GreenDark500, width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Center(
                  child: Text(
                    'I will play as a:',
                    style: themeData.textTheme.headline5!
                        .apply(color: c_Yellow100, fontWeightDelta: 1),
                  ),
                ),
              ),
            ),
          ),
          addVerticalSpace(20),
          Expanded(
            child: BlocBuilder(
              bloc: widget.rolesBloc,
              builder: (context, state) {
                if (state is RolesInitial) {
                  return showLoadSpinner();
                } else if (state is RolesLoaded) {
                  return buildRolesList(state);
                }
                return Container();
              },
            ),
            // child:
          ),
          addVerticalSpace(35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: BlocBuilder(
              bloc: widget.rolesBloc,
              builder: (context, state) => state is RolesInitial
                  ? Container()
                  : YellowButton(
                      'Continue',
                      onPressed: () {},
                      centeredContent: true,
                      border: Border.all(color: Colors.white, width: 2),
                      topBorderRadius: 15,
                    ),
            ),
          ),
          addVerticalSpace(20),
        ]),
      ),
    );
  }

  void requestRoles(int numberOfRoles) {
    // We will use the city name to search for the fake forecast
    //final rolesBloc = BlocProvider.of<RolesBloc>(context);
    widget.rolesBloc.add(GetRoles(numberOfRoles));
  }

  Widget showLoadSpinner() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black.withAlpha(0),
        color: c_Yellow,
      ),
    );
  }

  Widget buildRolesList(RolesLoaded state) {
    return ScrollSnapList(
      key: widget.sslKey,
      onItemFocus: (p0) {},
      itemSize: 300,
      itemCount: state.roles.length,
      reverse: true,
      dynamicItemSize: true,
      scrollPhysics: BouncingScrollPhysics(),
      initialIndex: 1,
      itemBuilder: (BuildContext context, int index) {
        return RoleItem(
          state.roles[index].title,
          onNext: () {
            widget.sslKey.currentState!
                .focusToItem((index - 1) % state.roles.length);
          },
          onPrev: () {
            widget.sslKey.currentState!
                .focusToItem((index + 1) % state.roles.length);
          },
        );
      },
      dynamicSizeEquation: (double distance) {
        double newValue = 1.0 - (distance.abs() * 0.00025);
        newValue = newValue.clamp(0.0, 1.0);
        return newValue;
      },
    );
  }
}

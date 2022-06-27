import 'package:flutter/material.dart';

class RoleItem extends StatelessWidget {
  final String label;
  final void Function() onNext;
  final void Function() onPrev;

  const RoleItem(
    this.label, {
    required this.onNext,
    required this.onPrev,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 260,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 260,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/bg_role.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Stack(children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(128),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: onPrev,
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            this.label,
                            overflow: TextOverflow.fade,
                            style: themeData.textTheme.headline5!
                                .apply(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: onNext,
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

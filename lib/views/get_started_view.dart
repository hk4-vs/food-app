import 'package:flutter/material.dart';
import 'package:food_app/views/dashboard_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.8),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  radius: width * 0.4,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    radius: width * 0.36,
                    backgroundImage:
                        const AssetImage("assets/images/start-food.png"),
                  )),
              Text(
                "Enjoy\nYour Food",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(width * 0.4, 60)),
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: const DashBoardView(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.slideUp,
                    );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const DashBoardView()));
                  },
                  child: Text(
                    "Get Started",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

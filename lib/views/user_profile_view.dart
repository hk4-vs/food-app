import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view-model/theme_mode_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  String selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: const UserProfileImage(
                          image: "assets/images/user-profile.jpg"),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.slideUp,
                    );
                  },
                  child: const Hero(
                    tag: "profile",
                    child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage("assets/images/user-profile.jpg")),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.10,
              ),
              personalDetails(context),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Settings",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              const SettingsContentWidget(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 60.0),
                      backgroundColor: const Color(0xff462B9C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    icon: Icon(
                      CupertinoIcons.power,
                      color: Theme.of(context).highlightColor,
                    ),
                    label: Text(
                      "  Logout",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).highlightColor,
                          letterSpacing: 2.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Table personalDetails(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(100),
        // 1: FixedColumnWidth(150),
      },
      children: [
        TableRow(children: [
          TableCell(
            child: Text(
              "Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.shadow),
            ),
          ),
          TableCell(
            child: Text(
              "Aaditya App Dev",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary
                  // decoration: TextDecoration.underline,
                  ),
            ),
          )
        ]),
        TableRow(children: [
          TableCell(
            child: Text(
              "Gender",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.shadow),
            ),
          ),
          TableCell(
            child: Text(
              "Male",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          )
        ]),
        TableRow(children: [
          TableCell(
            child: Text(
              "Age",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.shadow),
            ),
          ),
          TableCell(
            child: Text(
              "22 Year",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          )
        ]),
        TableRow(children: [
          TableCell(
            child: Text(
              "Email",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.shadow),
            ),
          ),
          TableCell(
            child: FittedBox(
              child: Text(
                "aaditya.appdev@gmail.com",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          )
        ]),
      ],
    );
  }
}

class SettingsContentWidget extends StatefulWidget {
  const SettingsContentWidget({
    super.key,
  });

  @override
  State<SettingsContentWidget> createState() => _SettingsContentWidgetState();
}

class _SettingsContentWidgetState extends State<SettingsContentWidget> {
  bool isNotification = true;
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                CupertinoIcons.globe,
                size: 30,
              ),
            ),
            title: Text(
              "Language",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "English   ",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.shadow),
                ),
                const Icon(CupertinoIcons.chevron_forward)
              ],
            ),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                CupertinoIcons.bell_solid,
                size: 30,
              ),
            ),
            title: Text(
              "Notification",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: CupertinoSwitch(
              value: isNotification,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) {
                setState(() {
                  isNotification = !isNotification;
                });
              },
            ),
          ),
          Consumer<ThemeModeViewModel>(builder: (context, provider, _) {
            return ListTile(
              leading: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  CupertinoIcons.moon_fill,
                  size: 30,
                ),
              ),
              title: Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: CupertinoSwitch(
                value: provider.isLight,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  provider.changeMode();
                },
              ),
            );
          }),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                CupertinoIcons.question_circle_fill,
                size: 30,
              ),
            ),
            title: Text(
              "Help Center",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
          )
        ],
      ),
    );
  }
}

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.left_chevron,
              color: Theme.of(context).primaryColor,
            )),
      ),
      body: Hero(tag: "profile", child: Image.asset(image)),
    );
  }
}

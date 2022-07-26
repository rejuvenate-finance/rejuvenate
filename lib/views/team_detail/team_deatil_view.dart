import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/app/theme.dart';
import 'package:rejuvenate/controllers/team_detail_controller.dart';
import 'package:rejuvenate/data/team_member.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TeamDetailView extends HookConsumerWidget {
  const TeamDetailView({Key? key, required this.teamMember}) : super(key: key);

  final TeamMember teamMember;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(TeamDetailController.instance);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.dark.primaryColor,
        elevation: 0.0,
        title: Text(teamMember.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: max(MediaQuery.of(context).size.width / 20, 32.0),
          vertical: 32.0,
        ),
        child: Center(
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScreenTypeLayout(
                mobile: SizedBox(
                  width: MediaQuery.of(context).size.width -
                      max(MediaQuery.of(context).size.width / 20, 32.0),
                  height: MediaQuery.of(context).size.height - 32.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: content(context),
                  ),
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: content(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> content(BuildContext context) {
    return [
      Flexible(
        child: teamMember.imagePath != null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          teamMember.imagePath!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: const Icon(
                      Icons.person,
                      size: 80.0,
                    ),
                  ),
                ),
              ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teamMember.name,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                teamMember.role,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              if (teamMember.location != null)
                Text(
                  teamMember.location!,
                ),
              const SizedBox(
                height: 32.0,
              ),
              AutoSizeText(
                teamMember.description,
                maxLines: 20,
                wrapWords: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (teamMember.twitter != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: IconButton(
                        icon: const Icon(LineIcons.twitter),
                        iconSize: 32.0,
                        onPressed: () {
                          launchUrlString(
                            "https://twitter.com/${teamMember.twitter}",
                          );
                        },
                      ),
                    ),
                  if (teamMember.linkedIn != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: IconButton(
                        icon: const Icon(LineIcons.linkedin),
                        iconSize: 32.0,
                        onPressed: () {
                          launchUrlString(
                            "https://linkedin.com/in/${teamMember.linkedIn}",
                          );
                        },
                      ),
                    ),
                  if (teamMember.github != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: IconButton(
                        icon: const Icon(LineIcons.github),
                        iconSize: 32.0,
                        onPressed: () {
                          launchUrlString(
                            "https://github.com/${teamMember.github}",
                          );
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
  }
}

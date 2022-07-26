import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rejuvenate/data/team_member.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:rejuvenate/app/routes.dart';
import 'package:rejuvenate/views/team_detail/team_deatil_view.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const _Content(
        crossAxisCount: 1,
      ),
      tablet: const _Content(
        crossAxisCount: 2,
      ),
      desktop: const _Content(
        crossAxisCount: 3,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key, required this.crossAxisCount}) : super(key: key);

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            children: [
              Entry.scale(
                child: AutoSizeText(
                  "Team",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxFontSize: 60.0,
                  maxLines: 1,
                  wrapWords: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Wrap(
                  spacing: 64.0,
                  runSpacing: 24.0,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: teamMembers
                      .map(
                        (member) => _TeamCard(
                          teamMember: member,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({Key? key, required this.teamMember}) : super(key: key);

  final TeamMember teamMember;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      height: 200.0,
      child: Card(
        color: Colors.black.withOpacity(0.05),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: teamMember.imagePath != null
                    ? InkWell(
                        onTap: () {
                          AppRouter.key.currentState?.push(
                            MaterialPageRoute(
                              builder: (context) => TeamDetailView(
                                teamMember: teamMember,
                              ),
                              settings:
                                  ModalRoute.of(context)?.settings.copyWith(
                                        name:
                                            '/team/${teamMember.name.toLowerCase()}',
                                      ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                teamMember.imagePath!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          AppRouter.key.currentState?.push(
                            MaterialPageRoute(
                              builder: (context) => TeamDetailView(
                                teamMember: teamMember,
                              ),
                              settings:
                                  ModalRoute.of(context)?.settings.copyWith(
                                        name:
                                            '/team/${teamMember.name.toLowerCase()}',
                                      ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          color: Theme.of(context).colorScheme.primary,
                          child: const Icon(
                            Icons.person,
                            size: 80.0,
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teamMember.name,
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
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

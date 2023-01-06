import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scoreboard/src/screens/add_result_form.dart';
import 'package:scoreboard/src/screens/add_event_form.dart';
import '../globals/enums.dart';
import '../models/event_model.dart';
import '../screens/results_page.dart';
import '../screens/schedule_page.dart';
import 'package:provider/provider.dart';
import '../screens/standings_page.dart';
import '../widgets/common/home_app_bar.dart';
import '../globals/colors.dart';
import '../stores/common_store.dart';
import '../widgets/common/bottom_navigation_bar.dart';
import '../widgets/schedule_page/add_button.dart';
import 'coming_soon.dart';
import 'gc_standings.dart';

class ScoreBoardHome extends StatefulWidget {
  static const id = '/gc/home';
  const ScoreBoardHome({Key? key}) : super(key: key);

  @override
  State<ScoreBoardHome> createState() => _ScoreBoardHomeState();
}

class _ScoreBoardHomeState extends State<ScoreBoardHome> {
  @override
  void initState() {
    super.initState();
  }

  Map<Pages, Widget> tabs = {
    Pages.schedule: const SchedulePage(),
    Pages.standings: const StandingsPage(),
    Pages.results: const ResultsPage(),
  };

  @override
  Widget build(BuildContext context) {
    var commonStore = context.read<CommonStore>();
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Themes.backgroundColor,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: AppBarHomeComponent(homeViewType: commonStore.viewType)),
          body: commonStore.competition == Competitions.gc
              ? const GCStandingsPage()
              : commonStore.competition == Competitions.spardha
                  ? tabs[commonStore.page]
                  : ComingSoon(
                      competition: commonStore.competition.toString(),
                    ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: commonStore.viewType == ViewType.user
              ? Container()
              : commonStore.competition == Competitions.spardha
                  ? commonStore.page == Pages.schedule
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddEventForm()));
                          },
                          child: const AddButton(
                            text: 'Add Event ',
                          ),
                        )
                      : Container()
                  : Container(),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}

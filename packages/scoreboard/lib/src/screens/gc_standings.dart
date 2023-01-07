import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/src/services/api.dart';
import '../functions/filter_men_women.dart';
import '../globals/styles/filter_style.dart';
import '../globals/colors.dart';
import '../stores/common_store.dart';
import '../widgets/standings_page/standingboard.dart';

class GCStandingsPage extends StatefulWidget {
  const GCStandingsPage({super.key});

  @override
  State<GCStandingsPage> createState() => _GCStandingsPageState();
}

class _GCStandingsPageState extends State<GCStandingsPage> {

  final _itemsCategory = ['Men', 'Women'];

  void onTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var commonStore = context.read<CommonStore>();
    commonStore.changeSelectedCategory('Men'); // making default category as men
    return FutureBuilder<List<dynamic>>(
      future: APIService(context).getGCStandings(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          {
           return CircularProgressIndicator();
          }
        return Observer(
          builder: (context) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                        child: Container(
                          height: 56,
                          decoration: boxDecoration,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                      child: Text('Category', style: popUpHeadingStyle),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 18,
                                      child: Text(
                                          'General Championship [${commonStore.selectedCategory.categoryName}]',
                                          style: popUpItemStyle),
                                    )
                                  ],
                                ),
                                PopupMenuButton<String>(
                                  color: Themes.cardColor1,
                                  icon: popUpIcon,
                                  initialValue: commonStore.selectedCategory.categoryName,
                                  onSelected: (value){
                                    commonStore.changeSelectedCategory(value);
                                  },
                                  itemBuilder: (BuildContext context) => _itemsCategory
                                      .map((item) => PopupMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              'General Championship [$item]',
                                              style: popUpItemStyle,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SvgPicture.asset(
                                "packages/scoreboard/assets/trophy.svg",
                            ),
                          ),
                          Text(
                            'GC [${commonStore.selectedCategory.categoryName}] Standings',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Themes.kWhite),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      thickness: 0.7,
                      color: Color.fromRGBO(94, 94, 94, 0.38),
                      height: 0,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Expanded(child: StandingBoard(hostelStandings: filterGCStandings(commonStore.selectedCategory,snapshot.data!),)), // passed empty list for now
                  ],
                ));
          }
        );
      }
    );
  }
}
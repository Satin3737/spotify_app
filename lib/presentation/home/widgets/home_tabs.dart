import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/presentation/home/widgets/news_songs.dart';

const List<Map<String, dynamic>> tabs = [
  {'text': 'News', 'widget': NewsSongs()},
  {'text': 'Video', 'widget': Placeholder()},
  {'text': 'Artists', 'widget': Placeholder()},
  {'text': 'Podcast', 'widget': Placeholder()},
  {'text': 'Songs', 'widget': Placeholder()},
  {'text': 'Info', 'widget': Placeholder()},
];

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        SizedBox(
          width: double.infinity,
          child: TabBar(
            controller: _tabController,
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.only(left: 8),
            isScrollable: true,
            indicatorWeight: 4,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
            splashFactory: NoSplash.splashFactory,
            indicatorColor: AppColors.primary,
            labelStyle: AppTexts.titleText(context, fontSize: 20),
            labelPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            labelColor: context.isDark ? AppColors.white : AppColors.black,
            unselectedLabelColor: AppColors.grey,
            tabs: tabs.map((item) => Text(item['text'] as String)).toList(),
          ),
        ),
        SizedBox(
          height: 240,
          child: TabBarView(
            controller: _tabController,
            children: tabs.map((item) => item['widget'] as Widget).toList(),
          ),
        )
      ],
    );
  }
}

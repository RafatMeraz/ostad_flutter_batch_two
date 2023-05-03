import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/category_card_widget.dart';

import '../widgets/home/app_bar_icon_button.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/remarks_title_widget.dart';
import '../widgets/home/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.notifications_none,
              onTap: () {},
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchTextField(),
            const SizedBox(
              height: 16,
            ),
            HomeCarouselWidget(),
            const SizedBox(
              height: 8,
            ),
            RemarksTitleWidget(
              remarksName: 'Categories',
              onTapSeeAll: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryCardWidget(
                    name: 'Computer',
                  ),
                  CategoryCardWidget(
                    name: 'Electronics',
                  ),
                  CategoryCardWidget(
                    name: 'Clothes',
                  ),
                  CategoryCardWidget(
                    name: 'Computer',
                  ),
                  CategoryCardWidget(
                    name: 'Computer',
                  ),
                  CategoryCardWidget(
                    name: 'Computer',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RemarksTitleWidget(
              remarksName: 'Popular',
              onTapSeeAll: () {},
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
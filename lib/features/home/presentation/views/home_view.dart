import 'package:e_commercy/core/utils/app_colors.dart';
import 'package:e_commercy/core/utils/app_router.dart';
import 'package:e_commercy/core/utils/screen_size.dart';
import 'package:e_commercy/core/utils/styles.dart';
import 'package:e_commercy/features/home/presentation/views/widgets/build_tab_bar.dart';
import 'package:e_commercy/features/home/presentation/views/widgets/horizontal_products_list_view.dart';
import 'package:e_commercy/features/home/presentation/views/widgets/title_and_see_all_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('ECommercy'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30.0)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, size: 30.0),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              context.go(AppRouter.kLoginView);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: BuildTabBar(tabController: _tabController, tabs: _tabs),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleAndSeeAllButton(),
                      SizedBox(
                        height: ScreenSize.screenHeight(context) / 4,
                        child: HorizontalProductsListView(),
                      ),
                      Divider(
                        color: AppColors.kPrimaryBackgroundColor,
                        thickness: 10.0,
                      ),
                      Text(
                        'All Products',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text('cvdfvdf'),
                  Text('cds'),
                  Text('cvdfvdf'),
                  Text('cds'),
                  Text('cvdfvdf'),
                  Text('cds'),
                  Text('cvdfvdf'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> _tabs = [
    Tab(child: Text('All')),
    Tab(child: Text('Electronics')),
    Tab(child: Text('All')),
    Tab(child: Text('Electronics')),
    Tab(child: Text('All')),
    Tab(child: Text('Electronics')),
    Tab(child: Text('All')),
    Tab(child: Text('Electronics')),
  ];
}

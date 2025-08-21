import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brother_admin_panel/features/dashboard/screens/index.dart';
import 'package:brother_admin_panel/utils/controllers/theme_controller.dart';
import 'package:brother_admin_panel/utils/styles/text_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showTabs = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 11, vsync: this);

    // إخفاء التاب تلقائياً بعد 3 ثواني
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showTabs = false;
        });
      }
    });
  }

  // دالة لإظهار التاب عند السحب للأعلى
  void _showTabsOnSwipe() {
    if (!_showTabs) {
      setState(() {
        _showTabs = true;
      });

      // إخفاء التاب مرة أخرى بعد 5 ثواني
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted && _showTabs) {
          setState(() {
            _showTabs = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GestureDetector(
          onVerticalDragEnd: (DragEndDetails details) {
            // إذا كان السحب للأعلى (velocity سالب) وإلى أعلى (offset سالب)
            if (details.primaryVelocity! < -500) {
              _showTabsOnSwipe();
            }
          },
          child: Scaffold(
            backgroundColor: themeController.isDarkMode
                ? const Color(0xFF1a1a2e) // Dark theme
                : const Color(0xFFf5f5f5), // Light theme
            body: Column(
              children: [
                // Top Tabs Bar
                Container(
                  color: themeController.isDarkMode
                      ? const Color(0xFF16213e) // Dark theme
                      : const Color(0xFFffffff), // Light theme
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Text(
                              'Brothers Creative',
                              style: TTextStyles.heading4.copyWith(
                                color: themeController.isDarkMode
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'ver 1.0.0',
                                style: TTextStyles.overline.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Spacer(),
                            // Theme Toggle Button
                            GetBuilder<ThemeController>(
                              builder: (themeController) {
                                return IconButton(
                                  onPressed: () {
                                    themeController.toggleTheme();
                                  },
                                  icon: Icon(
                                    themeController.isDarkMode
                                        ? Icons.light_mode
                                        : Icons.dark_mode,
                                    color: themeController.isDarkMode
                                        ? Colors.yellow
                                        : Colors.blue,
                                    size: 24,
                                  ),
                                  tooltip: themeController.isDarkMode
                                      ? 'تبديل إلى الوضع الفاتح'
                                      : 'تبديل إلى الوضع الداكن',
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            // Toggle Tabs Button
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _showTabs = !_showTabs;
                                });
                              },
                              icon: Icon(
                                _showTabs
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: themeController.isDarkMode
                                    ? Colors.white
                                    : Colors.black87,
                                size: 24,
                              ),
                              tooltip:
                                  _showTabs ? 'إخفاء التاب' : 'إظهار التاب',
                            ),
                          ],
                        ),
                      ),

                      // Tabs (Conditional)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: _showTabs ? 60 : 0,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _showTabs ? 1.0 : 0.0,
                          child: _showTabs
                              ? TabBar(
                                  controller: _tabController,
                                  isScrollable: true,
                                  indicatorColor: const Color(0xFF0055ff),
                                  indicatorWeight: 4,
                                  labelColor: themeController.isDarkMode
                                      ? Colors.white
                                      : Colors.black87,
                                  unselectedLabelColor:
                                      themeController.isDarkMode
                                          ? Colors.white70
                                          : Colors.black54,
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  tabs: const [
                                    Tab(
                                      icon: Icon(Icons.dashboard),
                                      text: 'Dashboard',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.track_changes),
                                      text: 'Projects Tracker',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.price_check),
                                      text: 'Prices Request',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.person),
                                      text: 'Interviews',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.shopping_cart),
                                      text: 'Shopping Orders',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.category),
                                      text: 'Categories',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.inventory),
                                      text: 'Products',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.article),
                                      text: 'Blog',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.photo_sharp),
                                      text: 'Gallery',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.campaign),
                                      text: 'Banners',
                                    ),
                                    Tab(
                                      icon: Icon(Icons.settings),
                                      text: 'Settings',
                                    ),
                                  ],
                                )
                              : Container(
                                  height: 20,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up,
                                          color: themeController.isDarkMode
                                              ? Colors.white54
                                              : Colors.black54,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'اسحب للأعلى لإظهار التاب',
                                          style: TTextStyles.caption.copyWith(
                                            color: themeController.isDarkMode
                                                ? Colors.white54
                                                : Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Area
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Dashboard Tab
                      Center(
                        child: Text(
                          'Dashboard Content',
                          style: TTextStyles.heading1.copyWith(
                            color: themeController.isDarkMode
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ),

                      // Projects Tracker Tab
                      const ProjectsTrackerScreen(),

                      // Prices Request Tab
                      const PricesRequestScreen(),

                      // Interviews Requests Tab
                      const InterviewsRequestsScreen(),

                      // Shopping Orders Tab
                      const ShoppingOrdersScreen(),

                      // Categories Tab
                      const CategoriesScreen(),

                      // Products Tab
                      const ProductsScreen(),

                      // Blog Tab
                      const BlogScreen(),

                      // Studio Tab
                      const StudioScreen(),

                      // Banners Tab
                      const BannersScreen(),

                      // Settings Tab
                      const SettingsScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

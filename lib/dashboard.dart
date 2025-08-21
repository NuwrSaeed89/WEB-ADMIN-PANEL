import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brother_admin_panel/features/dashboard/screens/index.dart';
import 'package:brother_admin_panel/utils/controllers/theme_controller.dart';
import 'package:brother_admin_panel/utils/styles/text_styles.dart';
import 'package:brother_admin_panel/localization/language_controller.dart';

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
        return Scaffold(
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
                            'appTitle'.tr,
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
                              'version'.tr,
                              style: TTextStyles.overline.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // Language Toggle Button
                          GetBuilder<LanguageController>(
                            builder: (languageController) {
                              return IconButton(
                                onPressed: () {
                                  if (languageController.isArabic) {
                                    languageController.changeToEnglish();
                                  } else {
                                    languageController.changeToArabic();
                                  }
                                },
                                icon: Icon(
                                  Icons.language,
                                  color: themeController.isDarkMode
                                      ? Colors.green
                                      : Colors.blue,
                                  size: 28,
                                ),
                                tooltip: languageController.isArabic
                                    ? 'Change to English'
                                    : 'تغيير إلى العربية',
                              );
                            },
                          ),
                          const SizedBox(width: 8),
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
                                  size: 28,
                                ),
                                tooltip: themeController.isDarkMode
                                    ? 'toggleToLightMode'.tr
                                    : 'toggleToDarkMode'.tr,
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
                              size: 28,
                            ),
                            tooltip: _showTabs ? 'hideTabs'.tr : 'showTabs'.tr,
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
                                unselectedLabelColor: themeController.isDarkMode
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
                                tabs: [
                                  Tab(
                                    icon: const Icon(Icons.dashboard, size: 20),
                                    text: 'dashboard'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.track_changes,
                                        size: 20),
                                    text: 'projectsTracker'.tr,
                                  ),
                                  Tab(
                                    icon:
                                        const Icon(Icons.price_check, size: 20),
                                    text: 'pricesRequest'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.person, size: 20),
                                    text: 'interviews'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.shopping_cart,
                                        size: 20),
                                    text: 'shoppingOrders'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.category, size: 20),
                                    text: 'categories'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.inventory, size: 20),
                                    text: 'products'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.article, size: 20),
                                    text: 'blog'.tr,
                                  ),
                                  Tab(
                                    icon:
                                        const Icon(Icons.photo_sharp, size: 20),
                                    text: 'gallery'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.campaign, size: 20),
                                    text: 'banners'.tr,
                                  ),
                                  Tab(
                                    icon: const Icon(Icons.settings, size: 20),
                                    text: 'settings'.tr,
                                  ),
                                ],
                              )
                            : Container(
                                height: 20,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_up,
                                        color: themeController.isDarkMode
                                            ? Colors.white54
                                            : Colors.black54,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'pressArrowToShowTabs'.tr,
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
                        'dashboardContent'.tr,
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
        );
      },
    );
  }
}

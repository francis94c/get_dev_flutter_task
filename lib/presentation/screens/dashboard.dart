import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_dev_flutter_task/config/app_colors.dart';
import 'package:get_dev_flutter_task/config/app_spacing.dart';
import 'package:get_dev_flutter_task/extensions/build_context.dart';
import 'package:get_dev_flutter_task/presentation/widgets/crypto_asset_grid_item.dart';
import 'package:get_dev_flutter_task/presentation/widgets/crypto_asset_list_item.dart';

class DashboardScreen extends HookWidget {
  static const String routeName = 'dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: AppSpacing.horizontalSpacing),
          child: SvgPicture.asset(
            'assets/svgs/qr.svg',
          ),
        ),
        leadingWidth: 45,
        actions: [
          SvgPicture.asset('assets/svgs/notifications.svg'),
          AppSpacing.horizontalSpaceSmall,
          SvgPicture.asset('assets/svgs/search.svg'),
          SizedBox(width: AppSpacing.horizontalSpacing),
        ],
        titleTextStyle: context.textTheme.bodyLarge,
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.verticalSpaceMedium,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: Row(
                children: [
                  Text(
                    'My balance',
                    style: context.textTheme.bodySmall,
                  ),
                  AppSpacing.horizontalSpaceTiny,
                  Icon(
                    Icons.remove_red_eye,
                    size: 12.sp,
                  )
                ],
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: RichText(
                text: TextSpan(
                  text: '₦',
                  style: context.textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: '5,000.',
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '00',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'My assets',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'See all',
                      textAlign: TextAlign.end,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: Column(
                children: [
                  const CryptoAssetListItem(
                    currency: 'btc',
                    name: 'Bitcoin',
                    amount: '₦24,500.00',
                    gain: 1.76,
                  ),
                  AppSpacing.verticalSpaceSmall,
                  const CryptoAssetListItem(
                      currency: 'eth',
                      name: 'Etherum',
                      amount: '₦24,500.00',
                      loss: 6.76),
                  AppSpacing.verticalSpaceSmall,
                  const CryptoAssetListItem(
                    currency: 'tezos',
                    name: 'Tezos',
                    amount: '₦24,500.00',
                    gain: 9.06,
                  ),
                ],
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Today's Top Movers",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'See all',
                      textAlign: TextAlign.end,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: SizedBox(
                height: .14.sh,
                width: 1.sw,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const CryptoAssetGridItem(
                        currency: 'eth',
                        name: 'Etherum',
                        loss: 1.76,
                      ),
                      AppSpacing.horizontalSpaceTiny,
                      const CryptoAssetGridItem(
                        currency: 'btc',
                        name: 'Bitcoin',
                        gain: 1.76,
                      ),
                      AppSpacing.horizontalSpaceTiny,
                      AppSpacing.horizontalSpaceTiny,
                      const CryptoAssetGridItem(
                        currency: 'solana',
                        name: 'Solana',
                        gain: 1.76,
                      ),
                      AppSpacing.horizontalSpaceTiny,
                    ],
                  ),
                ),
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Trending News",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'View more',
                      textAlign: TextAlign.end,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: RepaintBoundary(
                child: Image.asset('assets/images/musk.png'),
              ),
            ),
            AppSpacing.verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalSpacing,
              ),
              child: const Text(
                "Etherum Co-founder opposes El-savador Bitcoin Adoption policy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex.value,
        onTap: (index) {
          tabIndex.value = index;
        },
        selectedItemColor: AppColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/explore.svg',
              colorFilter: ColorFilter.mode(
                tabIndex.value == 0 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/portfolio.svg',
              colorFilter: ColorFilter.mode(
                tabIndex.value == 1 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/earn.svg',
              colorFilter: ColorFilter.mode(
                tabIndex.value == 2 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Earn',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/spend.svg',
              colorFilter: ColorFilter.mode(
                tabIndex.value == 3 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Spend',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/connect.svg',
              colorFilter: ColorFilter.mode(
                tabIndex.value == 4 ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Connect',
          ),
        ],
      ),
    );
  }
}

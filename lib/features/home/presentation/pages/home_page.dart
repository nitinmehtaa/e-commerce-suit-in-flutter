import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/features/home/presentation/widgets/feed_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _imgHomeIcon =
    'http://localhost:3845/assets/4e125aa37444bc9481b5df5eb23359fade54fd7d.svg';
const _imgHomeDot =
    'http://localhost:3845/assets/161347f81e273eb02906dba41422121cc1baf92e.svg';
const _imgCartIcon =
    'http://localhost:3845/assets/6413bd1d3b757b696e32f96af7e72f29d19cc427.svg';
const _imgHeartIcon =
    'http://localhost:3845/assets/5be48642ea853d0aebd72f9fe241b9250a8054d2.svg';
const _imgProfileIcon =
    'http://localhost:3845/assets/c02f000d3c9da8649feba3ecb83d4495fd852e82.svg';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, this.feedBody});

  final Widget? feedBody;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: feedBody ?? const FeedBody(),
      bottomNavigationBar: const _HomeBottomNavBar(),
    );
  }
}

class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF292526),
            borderRadius: BorderRadius.circular(44),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavIcon(
                iconUrl: _imgHomeIcon,
                isActive: true,
                showDot: true,
                dotUrl: _imgHomeDot,
              ),
              const _NavIcon(iconUrl: _imgCartIcon, showBadge: true),
              const _NavIcon(iconUrl: _imgHeartIcon),
              const _NavIcon(iconUrl: _imgProfileIcon),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.iconUrl,
    this.isActive = false,
    this.showDot = false,
    this.showBadge = false,
    this.dotUrl,
  });

  final String iconUrl;
  final bool isActive;
  final bool showDot;
  final bool showBadge;
  final String? dotUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0x0DFFFFFF),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Stack(
        children: [
          Center(
            child: SvgPicture.network(
              iconUrl,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          if (showDot && dotUrl != null)
            Positioned(
              bottom: 6,
              left: 18,
              child: SvgPicture.network(
                dotUrl!,
                height: 4,
                width: 4,
              ),
            ),
          if (showBadge)
            Positioned(
              top: 10,
              right: 9,
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFF13658),
                  borderRadius: BorderRadius.circular(7.5),
                  border: Border.all(color: Colors.white, width: 0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

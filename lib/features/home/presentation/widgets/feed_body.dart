import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

const _imgProduct1 =
    'http://localhost:3845/assets/f6694b845970a6c9f1f73259156265e2c4c85103.png';
const _imgProduct2 =
    'http://localhost:3845/assets/614453ef068eb58d25fd4f9e006121cffd52fcae.png';
const _imgProduct3 =
    'http://localhost:3845/assets/3fab88a9e64f25a4855a5c90d19743e943a790f9.png';
const _imgProduct4 =
    'http://localhost:3845/assets/38578013390fbffc5b1b33099f18242c6aaf9071.png';
const _imgProfile =
    'http://localhost:3845/assets/1406be1bb3e531935af8e5cf6bc014fde3dbc82c.png';
const _imgSearchIcon =
    'http://localhost:3845/assets/d1a97c70a407692e9d1072270e60a6a8677dc971.svg';
const _imgFilterIcon =
    'http://localhost:3845/assets/21cf7b35732453aefdc3028a2a542b4e479a8080.svg';
const _imgCategoryAll =
    'http://localhost:3845/assets/a7819bf2857c37e27ee25e0062c31baf30bf737b.svg';
const _imgCategoryDress =
    'http://localhost:3845/assets/f4d09635bc336fd49e1b6aefbf9ea470e736a846.svg';
const _imgCategoryTshirt =
    'http://localhost:3845/assets/2d25b3d73c0c317bbb86d9b40452abd4b400808a.svg';
const _imgCategoryJeans =
    'http://localhost:3845/assets/e6b71de70af6f18c070051d428ed90051aa099b1.svg';
const _imgHeartIcon =
    'http://localhost:3845/assets/d80d0fe8dcfd459955b606d82817a95af4165cdd.svg';
const _imgHeartOutlineIcon =
    'http://localhost:3845/assets/e866c259e3d1cc5e43f3b2ceec94617e9c5feb77.svg';

class FeedBody extends StatelessWidget {
  const FeedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _GreetingHeader(),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _SearchRow(),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _CategoryChips(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _ProductsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Welcome 👋',
                style: GoogleFonts.encodeSans(
                  color: Color(0xFF787676),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Albert Stevano',
                style: GoogleFonts.encodeSans(
                  color: Color(0xFF121111),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              image: NetworkImage(_imgProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchRow extends StatelessWidget {
  const _SearchRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFDFDEDE)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SvgPicture.network(
                  _imgSearchIcon,
                  height: 20,
                  width: 20,
                  colorFilter:
                      const ColorFilter.mode(Color(0xFFCAC9C9), BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Text(
                  'Search clothes. . . ',
                  style: GoogleFonts.encodeSans(
                    color: const Color(0xFFCAC9C9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 48,
          width: 48,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF292526),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.network(
            _imgFilterIcon,
            colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips();

  static const List<_CategoryChipData> _chips = [
    _CategoryChipData(label: 'All Items', iconUrl: _imgCategoryAll),
    _CategoryChipData(label: 'Dress', iconUrl: _imgCategoryDress),
    _CategoryChipData(label: 'T-Shirt', iconUrl: _imgCategoryTshirt),
    _CategoryChipData(label: 'Jeans', iconUrl: _imgCategoryJeans),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_chips.length, (index) {
          final chip = _chips[index];
          final isSelected = index == 0;
          return Padding(
            padding: EdgeInsets.only(right: index == _chips.length - 1 ? 0 : 10),
            child: _CategoryChip(
              data: chip,
              isSelected: isSelected,
            ),
          );
        }),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.data,
    required this.isSelected,
  });

  final _CategoryChipData data;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? const Color(0xFF292526) : Colors.white;
    final contentColor = isSelected ? const Color(0xFFFDFDFD) : const Color(0xFF292526);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? null
            : Border.all(color: const Color(0xFFDFDEDE)),
      ),
      child: Row(
        children: [
          SvgPicture.network(
            data.iconUrl,
            height: 16,
            width: 16,
            colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          Text(
            data.label,
            style: GoogleFonts.encodeSans(
              color: contentColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductsGrid extends StatelessWidget {
  const _ProductsGrid();

  static const _leftColumn = [
    _ProductCardData(
      title: 'Modern Light Jacket',
      subtitle: 'Outerwear',
      price: 212.99,
      rating: 5.0,
      imageUrl: _imgProduct1,
      imageHeight: 217,
    ),
    _ProductCardData(
      title: 'Classic Street Top',
      subtitle: 'T-Shirt',
      price: 194.99,
      rating: 5.0,
      imageUrl: _imgProduct3,
      imageHeight: 217,
    ),
    _ProductCardData(
      title: 'Soft Linen Shirt',
      subtitle: 'Casual',
      price: 162.99,
      rating: 5.0,
      imageUrl: _imgProduct2,
      imageHeight: 251,
      heartOutline: true,
    ),
  ];

  static const _rightColumn = [
    _ProductCardData(
      title: 'Light Wrap Dress',
      subtitle: 'Dress modern',
      price: 162.99,
      rating: 5.0,
      imageUrl: _imgProduct2,
      imageHeight: 251,
      heartOutline: true,
    ),
    _ProductCardData(
      title: 'Sunny Midi Dress',
      subtitle: 'Dress Modern',
      price: 122.99,
      rating: 5.0,
      imageUrl: _imgProduct4,
      imageHeight: 251,
    ),
    _ProductCardData(
      title: 'Modern Light Jacket',
      subtitle: 'Outerwear',
      price: 212.99,
      rating: 5.0,
      imageUrl: _imgProduct1,
      imageHeight: 217,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = (constraints.maxWidth - 16) / 2;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: columnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _leftColumn
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _ProductCard(data: item),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: columnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _rightColumn
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _ProductCard(data: item),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.data});

  final _ProductCardData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: data.imageHeight,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  data.imageUrl,
                  width: double.infinity,
                  height: data.imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF292526),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: SvgPicture.network(
                      data.heartOutline ? _imgHeartOutlineIcon : _imgHeartIcon,
                      height: 16,
                      width: 16,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.title,
          style: GoogleFonts.encodeSans(
            color: const Color(0xFF121111),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          data.subtitle,
          style: GoogleFonts.encodeSans(
            color: const Color(0xFF787676),
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              '\$${data.price.toStringAsFixed(2)}',
              style: GoogleFonts.encodeSans(
                color: const Color(0xFF292526),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            const SizedBox(width: 24),
            const Icon(Icons.star, size: 18, color: Color(0xFFFFD33C)),
            const SizedBox(width: 4),
            Text(
              data.rating.toStringAsFixed(1),
              style: GoogleFonts.encodeSans(
                color: const Color(0xFF292526),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryChipData {
  const _CategoryChipData({required this.label, required this.iconUrl});

  final String label;
  final String iconUrl;
}

class _ProductCardData {
  const _ProductCardData({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.imageHeight,
    this.heartOutline = false,
  });

  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final String imageUrl;
  final double imageHeight;
  final bool heartOutline;
}

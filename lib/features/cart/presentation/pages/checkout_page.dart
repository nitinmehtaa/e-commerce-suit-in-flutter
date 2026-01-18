import 'package:flutter/material.dart';
import 'package:flutter_app_tablayout/design_system/atoms/product_image.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      _CartLineItem(
        title: 'Modern light clothes',
        subtitle: 'Dress modern',
        price: 212.99,
        quantity: 4,
        imageUrl: 'lib/assets/iphone 8.png',
      ),
      _CartLineItem(
        title: 'Modern light clothes',
        subtitle: 'Dress modern',
        price: 162.99,
        quantity: 1,
        imageUrl: 'lib/assets/iphone 6s.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 6),
            _CheckoutAppBar(
              onBack: () => context.pop(),
              onMenu: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...items.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _CartItemTile(item: item),
                      ),
                    ),
                    Divider(color: Colors.grey.shade200, height: 32),
                    const Text(
                      'Shipping Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const _PaymentCardRow(
                      cardLabel: 'VISA',
                      maskedNumber: '**** **** **** 2143',
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _PriceRow(
                      label: 'Total (9 items)',
                      value: '\$1,014.95',
                      emphasized: false,
                    ),
                    const SizedBox(height: 10),
                    const _PriceRow(label: 'Shipping Fee', value: '\$0.00'),
                    const SizedBox(height: 10),
                    const _PriceRow(label: 'Discount', value: '\$0.00'),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade200, height: 28),
                    _PriceRow(
                      label: 'Sub Total',
                      value: '\$1,014.95',
                      emphasized: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _PayBar(),
      extendBody: true,
    );
  }
}

class _CheckoutAppBar extends StatelessWidget {
  const _CheckoutAppBar({
    required this.onBack,
    required this.onMenu,
  });

  final VoidCallback onBack;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _CircleIconButton(
            icon: Icons.arrow_back,
            onTap: onBack,
          ),
          const Expanded(
            child: Text(
              'Checkout',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          _CircleIconButton(
            icon: Icons.dehaze,
            onTap: onMenu,
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF7F7F7),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 40,
          width: 40,
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
      ),
    );
  }
}

class _CartLineItem {
  const _CartLineItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final double price;
  final int quantity;
  final String imageUrl;
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({required this.item});

  final _CartLineItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImage(
          imageUrl: item.imageUrl,
          height: 64,
          width: 64,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Icon(Icons.more_vert, color: Colors.black38, size: 20),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                item.subtitle,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    _formatPrice(item.price),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  _QuantityStepper(quantity: item.quantity),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StepButton(icon: Icons.remove),
        const SizedBox(width: 8),
        Text(
          '$quantity',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 8),
        _StepButton(icon: Icons.add),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE2E2E2)),
      ),
      child: Icon(icon, size: 16, color: Colors.black54),
    );
  }
}

class _PaymentCardRow extends StatelessWidget {
  const _PaymentCardRow({
    required this.cardLabel,
    required this.maskedNumber,
  });

  final String cardLabel;
  final String maskedNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            'lib/assets/figma/visa_pict.png',
            height: 28,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              maskedNumber,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.black45),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final labelStyle = emphasized
        ? const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          )
        : const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          );
    final valueStyle = emphasized
        ? const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          )
        : const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          );
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}

class _PayBar extends StatelessWidget {
  const _PayBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF222023),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _formatPrice(double value) => '\$${value.toStringAsFixed(2)}';

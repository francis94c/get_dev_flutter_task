import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoAssetListItem extends StatelessWidget {
  const CryptoAssetListItem({
    super.key,
    this.name,
    this.currency,
    this.price,
    this.gain,
    this.loss,
    this.amount,
    this.onPressed,
  });

  final String? name;
  final String? currency;
  final double? price;
  final double? gain;
  final double? loss;
  final String? amount;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/svgs/$currency.svg',
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name ?? 'N/A'),
                Text(
                  currency?.toUpperCase() ?? 'N/A',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount ?? 'N/A',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    gain == null
                        ? SvgPicture.asset('assets/svgs/loss.svg')
                        : SvgPicture.asset('assets/svgs/gain.svg'),
                    Text(
                      '${gain?.toString() ?? loss!.toString()}%',
                      style: TextStyle(
                        color: gain == null
                            ? const Color(0xFFC00F00)
                            : const Color(0xFF12A633),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

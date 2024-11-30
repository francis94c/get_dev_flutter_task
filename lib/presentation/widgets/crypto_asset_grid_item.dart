import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CryptoAssetGridItem extends StatelessWidget {
  const CryptoAssetGridItem({
    super.key,
    this.name,
    this.currency,
    this.price,
    this.gain,
    this.loss,
  });

  final String? name;
  final String? currency;
  final double? price;
  final double? gain;
  final double? loss;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .3),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(10.r),
      height: .13.sh,
      width: .18.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svgs/$currency.svg',
          ),
          Text(
            name ?? 'N/A',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              gain == null
                  ? SvgPicture.asset('assets/svgs/loss.svg')
                  : SvgPicture.asset('assets/svgs/gain.svg'),
              Text(
                '${gain?.toString() ?? loss?.toString() ?? 'N/A'}%',
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
    );
  }
}

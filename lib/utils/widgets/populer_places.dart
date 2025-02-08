import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';

class PopulerPlaces extends StatelessWidget {
  const PopulerPlaces({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image, title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              height: 190,
              width: 220,
              decoration: BoxDecoration(
                  color: AppColor.primary_color,
                  image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                  border: Border.all(color: AppColor.search_stroke),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              // child: Center(
              //   child: Image(
              //     image: AssetImage(image),
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

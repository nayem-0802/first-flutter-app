import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';

class PopularGuides extends StatelessWidget {
  const PopularGuides({
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
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: AppColor.primary_color,
                  // border: Border.all(color: AppColor.search_stroke),
                  borderRadius: BorderRadius.all(Radius.circular(80))),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

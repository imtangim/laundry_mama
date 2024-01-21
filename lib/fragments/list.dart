import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/components/widget/bttom_sheet.dart';
import 'package:laundry_mama_rework/utils/color.dart';
import 'package:laundry_mama_rework/utils/service.dart';
import 'package:laundry_mama_rework/utils/style.dart';

class ListOfLaundry extends StatefulWidget {
  const ListOfLaundry({super.key});

  @override
  State<ListOfLaundry> createState() => _ListOfLaundryState();
}

class _ListOfLaundryState extends State<ListOfLaundry> {
  double _dragStartY = 0.0;
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheetCart(); // Replace with the actual content of your bottom sheet
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.56,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ProductSelection();
            },
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: service.length,
          ),
        ),
        GestureDetector(
          onVerticalDragStart: (details) {
            _dragStartY = details.globalPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            final deltaY = details.globalPosition.dy - _dragStartY;
            // Set a threshold to trigger the bottom sheet
            if (deltaY < -50.0) {
              _showBottomSheet(context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.width,
            height: context.height * 0.15,
            child: Padding(
              padding: const EdgeInsets.all(18.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_circle_up),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Slide up for details")
                    ],
                  ),
                  Text(
                    "Your Cart",
                    style: CustomStyle.headingStyle,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total item"),
                      Text("50 Items"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class ProductSelection extends StatelessWidget {
  const ProductSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SizedBox(
        width: 50,
        child: CircleAvatar(
          radius: 50,
          child: Image.asset('asset/images/cloth9.png'),
        ),
      ),
      title: Text(
        "Title",
        style: CustomStyle.headingStyle,
      ),
      subtitle: Text(
        "10",
        style: CustomStyle.headingStyle,
      ),
      trailing: SizedBox(
        width: context.width * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: CustomAsset.primaryColor,
                foregroundColor: CustomAsset.foregroundColor,
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
            Text(
              "3",
              style: CustomStyle.headingStyle.copyWith(fontSize: 20),
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: CustomAsset.primaryColor,
                foregroundColor: CustomAsset.foregroundColor,
                child: const Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

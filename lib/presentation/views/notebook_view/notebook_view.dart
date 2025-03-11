import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';
import 'package:my_keeper_vietflash/common/constants/assets.dart';
import 'package:my_keeper_vietflash/presentation/views/notebook_view/widgets/addexpence_bottomsheet.dart';

import '../../../common/res/colors.dart';
import '../../../common/res/dimens.dart';
import '../../widgets/common_text_styles.dart';

class NotebookView extends StatefulWidget {
  const NotebookView({super.key});

  @override
  State<NotebookView> createState() => _NotebookViewState();
}

class _NotebookViewState extends State<NotebookView>
    with BaseMixin, SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.pink,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              backgroundColor: ColorsRes.pink,
              leading: IconButton(
                icon: const Icon(Icons.search, color: ColorsRes.white),
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.pink,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    4,
                    (index) => _buildItem(
                      icon: Assets.noteBookIcon,
                      label: "Notebook",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(context));
  }
}

Widget _buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(DimensRes.sp12)),
        ),
        builder: (context) {
          return const AddExpenseBottomSheet();
        },
      );
    },
    backgroundColor: ColorsRes.white,
    child: Image.asset(
      Assets.pencilIcon,
      height: DimensRes.sp30,
      width: DimensRes.sp30,
    ),
  );
}

Widget _buildItem({
  required String icon,
  required String label,
}) {
  Alignment alignment = Alignment.center;
  return Container(
    alignment: alignment,
    width: ScreenUtil().screenWidth / 4,
    height: DimensRes.sp60,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          //_onNavItemSelected(navItem);
        },
        borderRadius: BorderRadius.circular(50),
        splashColor: ColorsRes.black.withOpacity(0.2),
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: DimensRes.sp72),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: DimensRes.sp26,
                  margin: const EdgeInsets.only(
                      top: DimensRes.sp6,
                      right: DimensRes.sp11,
                      left: DimensRes.sp11),
                  child: Image.asset(
                    icon,
                    height: DimensRes.sp15,
                  ),
                ),
                Text(
                  label,
                  style: CommonTextStyles.smallBold.copyWith(
                    fontSize: DimensRes.sp11,
                    height: DimensRes.sp1_448,
                    color: ColorsRes.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

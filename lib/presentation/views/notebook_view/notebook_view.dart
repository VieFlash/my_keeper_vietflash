import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_keeper_vietflash/common/base/base_mixin.dart';
import 'package:my_keeper_vietflash/common/constants/assets.dart';
import 'package:my_keeper_vietflash/config/di/app_module.dart';
import 'package:my_keeper_vietflash/presentation/views/notebook_view/widgets/addexpence_bottomsheet.dart';

import '../../../common/res/colors.dart';
import '../../../common/res/dimens.dart';
import '../../../utils/screen_helper.dart';
import '../../widgets/common_text_styles.dart';
import 'notebook_controller.dart';

class NotebookView extends StatefulWidget {
  const NotebookView({super.key});

  @override
  State<NotebookView> createState() => _NotebookViewState();
}

class _NotebookViewState extends State<NotebookView>
    with BaseMixin, SingleTickerProviderStateMixin {
  final _noteBookController = serviceLocator<NoteBookController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: ColorsRes.gray200,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              backgroundColor: ColorsRes.primary,
              leading: IconButton(
                icon: const Icon(Icons.search, color: ColorsRes.white),
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: ColorsRes.pinkWhite,
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
      ),
      _buildFloatingActionButton(context, _animationController),
    ]);
  }

  Widget _buildFloatingActionButton(
      BuildContext context, AnimationController animationController) {
    return Obx(
      () => Positioned(
        top: _noteBookController.isDragPreviewButton.isTrue
            ? ScreenHelper().setOffSetInScreen(
                size: _noteBookController.offsetEventDetail.value.dy -
                    ScreenUtil().statusBarHeight,
                isDx: false,
                context: context)
            : null,
        bottom: _noteBookController.isDragPreviewButton.isTrue
            ? null
            : DimensRes.sp20,
        left: _noteBookController.isOnLeft.isTrue ? DimensRes.sp20 : null,
        right: _noteBookController.isOnLeft.isTrue ? null : DimensRes.sp20,
        child: Draggable(
          feedback: _buttonFloating(context),
          childWhenDragging: Container(),
          child: _buttonFloating(context),
          onDragEnd: (details) {
            final screenWidth = ScreenUtil().screenWidth;
            final isOnLeft = details.offset.dx < screenWidth / 2;
            _noteBookController.isDragPreviewButton.value = true;
            _noteBookController.offsetEventDetail.value = details.offset;
            _noteBookController.isOnLeft.value = isOnLeft;
          },
        ),
      ),
    );
  }

  Widget _buttonFloating(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(DimensRes.sp12)),
          ),
          builder: (context) {
            return const AddExpenseBottomSheet();
          },
        );
      },
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(DimensRes.sp15),
          foregroundColor: ColorsRes.primary),
      child: Image.asset(
        Assets.pencilIcon,
        width: DimensRes.sp36,
        height: DimensRes.sp36,
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
}

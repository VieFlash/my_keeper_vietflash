import 'package:flutter/material.dart';

import '../../common/res/colors.dart';
import '../../common/res/dimens.dart';

class CommonLoading extends StatefulWidget {
  const CommonLoading({
    Key? key,
    this.color = ColorsRes.black,
    this.isNoOpacity = false,
  }) : super(key: key);

  final Color color;
  final bool isNoOpacity;

  @override
  State<CommonLoading> createState() => _CommonLoadingState();
}

class _CommonLoadingState extends State<CommonLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Cubic curves = Curves.ease;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    const double size = DimensRes.sp16;
    const Color leftDotColor = ColorsRes.primary;
    const Color rightDotColor = ColorsRes.lightPink;

    return Container(
      color: widget.isNoOpacity
          ? widget.color.withOpacity(1)
          : widget.color.withOpacity(0.7),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _BuildDot(
              size: size,
              color: leftDotColor,
              initialOffset: const Offset(-size / 4, 0),
              finalOffset: const Offset(size * 4 / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              controller: _animationController,
              visibility: _animationController.value <= 0.5,
            ),
            _BuildDot(
              size: size,
              color: rightDotColor,
              initialOffset: const Offset(size / 4, 0),
              finalOffset: const Offset(-size * 4 / 4, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              visibility: _animationController.value <= 0.5,
              controller: _animationController,
            ),
            _BuildDot(
              size: size,
              color: rightDotColor,
              initialOffset: const Offset(-size / 4, 0),
              finalOffset: const Offset(size * 4 / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
            _BuildDot(
              size: size,
              color: leftDotColor,
              initialOffset: const Offset(size / 4, 0),
              finalOffset: const Offset(-size * 4 / 4, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _BuildDot extends StatelessWidget {
  final double size;
  final Color color;
  final Offset initialOffset;
  final Offset finalOffset;
  final Interval interval;
  final bool visibility;
  final AnimationController controller;

  const _BuildDot({
    Key? key,
    required this.size,
    required this.color,
    required this.initialOffset,
    required this.finalOffset,
    required this.interval,
    required this.visibility,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offset offsetAnimation = Tween<Offset>(
      begin: initialOffset,
      end: finalOffset,
    )
        .animate(
          CurvedAnimation(parent: controller, curve: interval),
        )
        .value;

    return Visibility(
      visible: visibility,
      child: Transform.translate(
        offset: offsetAnimation,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

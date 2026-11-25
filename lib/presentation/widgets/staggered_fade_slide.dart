import 'package:flutter/material.dart';
import 'package:mobile_ecommerce_ui/core/app_motion.dart';

class StaggeredFadeSlide extends StatefulWidget {
  final int index;
  final Widget child;

  const StaggeredFadeSlide({
    super.key,
    required this.index,
    required this.child,
  });

  @override
  State<StaggeredFadeSlide> createState() => _StaggeredFadeSlideState();
}

class _StaggeredFadeSlideState extends State<StaggeredFadeSlide>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: AppMotion.normal);
    _opacity = CurvedAnimation(parent: _controller, curve: AppMotion.standard);
    _offset = Tween<Offset>(
      begin: const Offset(0, AppMotion.staggerOffset),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.standard));

    final delay = AppMotion.staggerStep * widget.index;
    Future<void>.delayed(delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(offset: _offset.value, child: child),
        );
      },
      child: widget.child,
    );
  }
}

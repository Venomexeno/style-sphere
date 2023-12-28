import 'package:ecommerce/features/order/presentation/widgets/on_going_list_view_bloc_builder.dart';
import 'package:ecommerce/features/root/presentation/manager/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderPageBody extends StatefulWidget {
  const OrderPageBody({super.key});

  @override
  State<OrderPageBody> createState() => _OrderPageBodyState();
}

class _OrderPageBodyState extends State<OrderPageBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index != _tabController.previousIndex) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(right: 20, top: 15, left: 20),
            sliver: SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  context.read<NavigationCubit>().navigateTo(0);
                },
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    width: 50.h,
                    height: 50.h,
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Order',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 200.w,
                        height: 50.h,
                        child: TabBar(
                          physics: const NeverScrollableScrollPhysics(),
                          splashBorderRadius: BorderRadius.circular(10.r),
                          indicatorWeight: 0,
                          indicator: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: const Color(0xffA1A8B0),
                          controller: _tabController,
                          tabs: [
                            Tab(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: _tabController.index == 0
                                        ? Colors.transparent
                                        : const Color(0xff666666),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ongoing',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                    color: _tabController.index == 1
                                        ? Colors.transparent
                                        : const Color(0xff666666),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'completed',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      controller: _tabController,
                      children: const [
                        OnGoingListViewBlocBuilder(),
                        Center(
                          child: Text('Oops, You have no any completed orders yet'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



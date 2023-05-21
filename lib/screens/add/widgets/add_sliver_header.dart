part of '../add_medical_screen.dart';

class _AddSilverHeader extends StatelessWidget {
  // const _SilverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _CloseAppBar(),
      floating: true,
      pinned: true,
    );
  }
}

class _CloseAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Color(0xFF292828),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34.0),
              ),
              child: SizedBox(
                width: 36,
                height: 36,
                child: IconButton(
                  color: Colors.white,
                  disabledColor: Colors.red[300],
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                  style: IconButton.styleFrom(
                      iconSize: 19, backgroundColor: Colors.black54),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('images/first-aid-kit.png'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 220;

  @override
  double get minExtent => 220;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

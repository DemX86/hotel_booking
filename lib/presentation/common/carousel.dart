import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common.dart';

class Carousel extends StatefulWidget {
  final List<String> imageUrls;

  const Carousel({super.key, required this.imageUrls});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final _pageController = PageController(viewportFraction: 1.05);
  var _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lc = AppLocalizations.of(context)!;
    final imageCount = widget.imageUrls.length;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 257,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imageCount,
              itemBuilder: (_, index) {
                return FractionallySizedBox(
                  widthFactor: 1 / _pageController.viewportFraction,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      fit: BoxFit.cover,
                      widget.imageUrls[index],
                      loadingBuilder: (_, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (_, error, ___) {
                        debugPrint('Image loading error: $error');
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.image_not_supported_outlined,
                                color: greyColor,
                                size: 48,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                lc.imageLoadingError,
                                style: Styles.formHelper,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: List.generate(imageCount, (index) {
                  final isLastItem = index == imageCount - 1;
                  final isCurrentItem = index == _currentPageIndex;
                  return Padding(
                    padding: EdgeInsets.only(right: isLastItem ? 0 : 5),
                    child: CircleAvatar(
                      backgroundColor: isCurrentItem
                          ? Colors.black
                          : const Color.fromRGBO(0, 0, 0, 0.22),
                      radius: 3.5,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

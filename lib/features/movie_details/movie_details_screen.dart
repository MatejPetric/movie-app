import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common_widgets/cached_network_image_widget.dart';
import 'package:movie_app/features/movie_details/data/movie_details_repository.dart';
import 'package:movie_app/features/movie_details/widgets/movie_details_sheet_content.dart';
import 'package:movie_app/features/movie_details/widgets/sheet_widget.dart';
import 'package:movie_app/services/network/api_endpoints.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final String id;
  const MovieDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double initialChildSize = 0.65;
    double maxChildSize = 0.85;
    double minChildSize = 0.65;
    final movieDetails = ref.watch(movieDetailsProvider(id));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: movieDetails.when(
        data: (movieDetails) => Stack(
          children: [
            CachedNetworkImageWidget(
              url: '${apiEndpoints.posterBase}${movieDetails.posterPath}',
              height: 334.h,
              width: double.infinity,
            ),
            SheetWidget(
              initialChildSize: initialChildSize,
              maxChildSize: maxChildSize,
              minChildSize: minChildSize,
              child: MovieDetailsSheetContent(
                movieDetails: movieDetails,
              ),
            )
          ],
        ),
        error: (error, stackTrace) {
          return const Text('error');
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

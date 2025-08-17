import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerStatefulWidget {
  const MoviesByCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: Column(
        children: [
          MoviesBox(title: "Mais populares",),
          MoviesBox(title: "Top filmes",),
        ],
      ),
    );
  }
}

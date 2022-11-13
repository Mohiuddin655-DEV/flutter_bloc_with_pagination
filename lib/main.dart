import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_pagination/cubit/posts_cubit.dart';
import 'package:flutter_bloc_with_pagination/data/repositories/posts_respository.dart';
import 'package:flutter_bloc_with_pagination/data/services/posts_service.dart';

import 'presentation/posts_screen.dart';

void main() {
  runApp(PaginationApp(
    repository: PostsRepository(PostsService()),
  ));
}

class PaginationApp extends StatelessWidget {
  final PostsRepository? repository;

  const PaginationApp({Key? key, this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(repository!),
        child: PostsView(),
      ),
    );
  }
}

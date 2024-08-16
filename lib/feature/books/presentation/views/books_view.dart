import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';

import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/books/data/repo/book_repo_imp.dart';
import 'package:voyago/feature/books/presentation/manger/books_cubit/books_cubit_cubit.dart';
import 'package:voyago/feature/books/presentation/manger/books_cubit/books_cubit_state.dart';
import 'package:voyago/feature/books/presentation/views/widgets/card_books.dart';

import '../../../../core/utils/services_locater.dart';
import '../../../wallet/data/repo/wallet_repo_impl.dart';
import '../../data/models/books_model.dart';
import 'widgets/books_empty.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BooksBody();
  }
}

class BooksBody extends StatefulWidget {
  const BooksBody({super.key});

  @override
  State<BooksBody> createState() => _BooksBodyState();
}

class _BooksBodyState extends State<BooksBody> {
  @override
  Widget build(BuildContext context) {
    return CustomTabBar(tabs: [
      Tab(
        text: "Upcoming".tr(),
      ),
      Tab(
        text: "Completed".tr(),
      ),
      Tab(
        text: "Cancelled".tr(),
      ),
    ], tabViews: [
      const UpcomingBooksView(),
      BlocProvider(
        create: (context) => BooksCubit(getIt.get<BooksImpl>()),
        child: const CompletedBooksView(),
      ),
      const Text("data"),
    ], titel: "My bookings".tr());
  }
}

class UpcomingBooksView extends StatelessWidget {
  const UpcomingBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BooksEmpty(),
    );
  }
}

class CompletedBooksView extends StatelessWidget {
  const CompletedBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BooksListView();
  }
}

class BooksListView extends StatelessWidget {
  BooksListView({super.key, this.data});
  List<TripData>? data;
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      context.read<BooksCubit>().fetchBooks();
      return BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state is BooksSuccess) {
            BooksModel model = state.model;

            return ListBooks(
              tripData: model.data,
            );
          } else if (state is BooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BooksFailure) {
            print(state.errorMessage);
            return const BooksEmpty();
            // return const Center(
            //     child: Text(
            //   "falier",
            //   style: TextStyle(color: Colors.white),
            // ));
          }
          return const Text(
            "errrror",
            style: TextStyle(color: Colors.white),
          );
        },
      );
    }
    return const Text("data");
  }
  // return ListView(children: const [
  //   SizedBox(
  //     height: 20,
  //   ),

  // Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 10),
  //   child: GestureDetector(
  //     onTap: () {
  //       GoRouter.of(context).push(AppRouter.kDetilesBooksView);
  //     },
  //     child: CustomCard(
  //       content: CardBooks(paymentState: "Paid".tr()),
  //       title: "NY City Tour ",
  //     ),
  //   ),
  // ),
  // const SizedBox(height: 10),
  // Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 10),
  //   child: CustomCard(
  //     content: CardBooks(paymentState: "Paid".tr()),
  //     title: "NY City Tour ",
  //   ),
  // ),
  // const SizedBox(height: 10),
  // Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 10),
  //   child: CustomCard(
  //     content: CardBooks(paymentState: "UnPaid".tr()),
  //     title: "NY City Tour ",
  //   ),
  // ),
  //  ]);
}

class ListBooks extends StatelessWidget {
  ListBooks({
    super.key,
    // required this.model,
    required this.tripData,
  });

  // final List<BooksModel> model;
  List<TripData> tripData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tripData.length,
        itemBuilder: (BuildContext context, int index) {
          return CardBooks(
            paymentState: "Paid".tr(),
            tripData: tripData[index],
          );
          // return null;
        });
  }
}
//   }
// }

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final int initialIndex;
  final String titel;
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.initialIndex = 0,
    required this.titel,
  }) : assert(tabs.length == tabViews.length,
            'Tabs and TabViews must have the same length.');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.transparent
              : CustomColors.kGrey[0],
          title: Text(titel),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: ButtonsTabBar(
            radius: 20,
            width: 120,
            contentCenter: true,
            labelStyle: Styles.textStyle14W600
                .copyWith(color: Colors.white, fontSize: 13),
            backgroundColor:

                ///const Color(0xff6214C8),
                CustomColors.kMove[4],
            unselectedBackgroundColor: CustomColors.kWhite[4],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            tabs: tabs,
          ),
        ),
        body: TabBarView(children: tabViews),
      ),
    );
  }
}

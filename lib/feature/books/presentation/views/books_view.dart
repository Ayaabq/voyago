import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';

import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/books/presentation/views/widgets/card_books.dart';

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
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: CustomColors.kGrey[0],
          title: const Text("My bookings"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: ButtonsTabBar(
              radius: 20,
              width: 120,
              contentCenter: true,
              labelStyle: Styles.textStyle14W600
                  .copyWith(color: Colors.white, fontSize: 13),
              backgroundColor: CustomColors.kMove[4],
              unselectedBackgroundColor: CustomColors.kWhite[4],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              tabs: const [
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Cancelled",
                ),
              ]),
        ),
        body: const TabBarView(children: [
          UpcomingBooksView(),
          CompletedBooksView(),
          Text("data"),
        ]),
      ),
    );
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
    return ListView(children: [
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kDetilesBooksView);
          },
          child: const CustomCard(
            content: CardBooks(paymentState: " Paid "),
            title: "NY City Tour ",
          ),
        ),
      ),
      const SizedBox(height: 10),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomCard(
          content: CardBooks(paymentState: " Paid "),
          title: "NY City Tour ",
        ),
      ),
      const SizedBox(height: 10),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomCard(
          content: CardBooks(paymentState: " UnPaid "),
          title: "NY City Tour ",
        ),
      ),
    ]);
  }
}

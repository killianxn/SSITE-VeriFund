import 'package:flutter/material.dart';
import 'records.dart';
import 'add_expense.dart';
import 'add_balance.dart';

void main() {
  runApp(const MyApp());
}

// variable colors
const Color red = Color(0xFFC72C3B);
const Color beige = Color.fromARGB(255, 245, 238, 221);
const Color paleBlue = Color.fromARGB(255, 196, 216, 230);
const Color lightBlue = Color.fromARGB(255, 166, 199, 230);
const Color mediumBlue = Color.fromARGB(255, 142, 177, 209);
const Color darkBlue = Color.fromARGB(255, 28, 43, 72);

// main app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: beige,
      ),
      // main screen of the application.
      home: const DashboardScreen(),
    );
  }
}

// dashboard screen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderBar(),
              SizedBox(height: 20),
              RemainingFundsCard(),
              SizedBox(height: 24),
              PieChartSection(),
              SizedBox(height: 24),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TotalFundsCard(),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 3,
                      child: NewTransactionButton(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              LatestTransactionsSection(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}

// 1. header bar class
class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        // Organization name
        // Application name
        const Text(
          'VeriFund',
          style: TextStyle(
            fontFamily: 'Press',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: darkBlue,
          ),
        ),

        // for logos
        Row(
          children: [
            _buildCircleIcon(
              Image.asset(
                'lib/assets/MCC.png',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 5),
            _buildCircleIcon(
              Image.asset(
                'lib/assets/ICS.png',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 5),
            _buildCircleIcon(
              Image.asset(
                'lib/assets/SSITE.png',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircleIcon(Image image) {
    return SizedBox(
      width: 35,
      height: 35,
      child: image,
    );
  }
}

// 2. remaining funds card class
class RemainingFundsCard extends StatelessWidget {
  const RemainingFundsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 22,
      ),

      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(6, 7),
          ),
        ],
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Remaining Funds:',
            style: TextStyle(
              fontFamily: 'Space',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: darkBlue,
            ),
          ),

          SizedBox(height: 8),

          // ==================================================
          // CHANGE THIS LATER
          // This should eventually come from:
          //
          // Total Funds - Total Expenses
          // ==================================================

          Text(
            '₱ 40,000.00',
            style: TextStyle(
              fontFamily: 'Pixelify',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}

// 3. pie chart and categories class
class PieChartSection extends StatelessWidget {
  const PieChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,


      children: [
        // =====================================================
        // PIE CHART
        // =====================================================
        //
        // CHANGE THIS LATER
        // Replace this placeholder with an actual pie chart.
        //
        Container(
          width: 160,
          height: 160,

          decoration: BoxDecoration(
            color: darkBlue,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(
              color: Colors.black,
              offset: Offset(6, 7),
              ),
            ],
          ),

          child: const Center(
            child: Text(
              'PIE CHART',
              style: TextStyle(
                fontFamily: 'Space',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),

        const SizedBox(width: 40),

        // PIE CHART LEGEND
        Expanded(
          child: Column(
            children: [
              _buildLegendRow(
                darkBlue,
                // CHANGE LATER
                'CATEGORY_1',
                // CHANGE LATER
                '₱ AMOUNT',
              ),
              const SizedBox(height: 12),
              _buildLegendRow(
                mediumBlue,
                // CHANGE LATER
                'CATEGORY_2',
                // CHANGE LATER
                '₱ AMOUNT',
              ),
              const SizedBox(height: 12),
              _buildLegendRow(
                paleBlue,
                // CHANGE LATER
                'CATEGORY_3',
                // CHANGE LATER
                '₱ AMOUNT',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendRow( // category in pie chart
      Color color,
      String title,
      String subtitle,
      ) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 36,

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Space',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Space',
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: darkBlue.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 4. total funds card class
class TotalFundsCard extends StatelessWidget {
  const TotalFundsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),

      decoration: BoxDecoration(
        color: paleBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(6, 7),
          ),
        ],
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Total Funds:',
            style: TextStyle(
              fontFamily: 'Space',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: darkBlue,
            ),
          ),

          SizedBox(height: 8),

          // ==================================================
          // CHANGE THIS LATER
          // ==================================================

          Text(
            '₱ TOTAL_FUNDS',
            style: TextStyle(
              fontFamily: 'Pixelify',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),

          SizedBox(height: 4),

          Text(
            'Total Allocated Budget',
            style: TextStyle(
              fontFamily: 'Space',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}

// 4.1 Make new transaction class
class NewTransactionButton extends StatelessWidget {
  const NewTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container( // for dagdag money
              decoration: BoxDecoration(
                color: mediumBlue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(6, 7),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddBalanceScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.monetization_on_rounded, size: 30, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: Container( // for new expense
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(6, 7),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddExpenseScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.post_add_rounded, size: 30, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 5. scrollable recent transactions
class LatestTransactionsSection extends StatelessWidget {
  const LatestTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'Recent Transactions',
          style: TextStyle(
            fontFamily: 'Pixelify',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: darkBlue,
          ),
        ),

        const SizedBox(height: 5),

        // Horizontal scrolling transaction cards.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(

            vertical: 8,
          ),

          child: Row(
            children: const [
              // =================================================
              // TRANSACTION 1
              // =================================================

              _TransactionCard(
                // CHANGE LATER
                line1: 'TRANSACTION_1_NAME',

                // CHANGE LATER
                line2: 'TRANSACTION_1_CATEGORY',

                // CHANGE LATER
                line3: '₱ TRANSACTION_1_AMOUNT',
              ),

              SizedBox(width: 10),

              // =================================================
              // TRANSACTION 2
              // =================================================

              _TransactionCard(
                // CHANGE LATER
                line1: 'TRANSACTION_2_NAME',

                // CHANGE LATER
                line2: 'TRANSACTION_2_CATEGORY',

                // CHANGE LATER
                line3: '₱ TRANSACTION_2_AMOUNT',
              ),

              SizedBox(width: 10),

              // =================================================
              // TRANSACTION 3
              // =================================================

              _TransactionCard(
                // CHANGE LATER
                line1: 'TRANSACTION_3_NAME',

                // CHANGE LATER
                line2: 'TRANSACTION_3_CATEGORY',

                // CHANGE LATER
                line3: '₱ TRANSACTION_3_AMOUNT',
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Container(
          height: 4,

          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

// individual transaction card design
class _TransactionCard extends StatelessWidget {
  final String line1;
  final String line2;
  final String line3;

  const _TransactionCard({
    required this.line1,
    required this.line2,
    required this.line3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  line1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontFamily: 'Space',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),

                Text(
                  line2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontFamily: 'Space',
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: mediumBlue,
                  ),
                ),

                Text(
                  line3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontFamily: 'Space',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          // Placeholder for transaction icon/image.
          Container(
            width: 32,
            height: 37,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

// 7. bottom navigation bar class
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          border: Border.all(
            color: Colors.black,
            width: 4.0,
            style: BorderStyle.solid,
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            // HOME
            _NavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              selected: selectedIndex == 0,

              onTap: () {
                if (selectedIndex != 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                }
              },
            ),

            // RECORDS
            _NavItem(
              icon: Icons.receipt_long_rounded,
              label: 'Records',
              selected: selectedIndex == 1,

              onTap: () {
                if (selectedIndex != 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransactionRecordsScreen(),
                    ),
                  );
                }
              },
            ),

            // FUNDS
            _NavItem(
              icon: Icons.account_balance_wallet_rounded,
              label: 'Funds',
              selected: selectedIndex == 2,

              onTap: () {
                // Funds screen will go here later
              },
            ),

            // PROFILE
            _NavItem(
              icon: Icons.person_rounded,
              label: 'Profile',
              selected: selectedIndex == 3,

              onTap: () {
                // Profile screen will go here later
              },
            ),
          ],
        ),
      ),
    );
  }
}

// navigation icons class
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(
            icon,
            color: selected
                ? lightBlue
                : Colors.white.withOpacity(0.6),
            size: 23,
          ),

          const SizedBox(height: 3),

          Text(
            label,
            style: TextStyle(
              fontFamily: 'Space',
              color: selected
                  ? lightBlue
                  : Colors.white.withOpacity(0.6),
              fontSize: 9,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
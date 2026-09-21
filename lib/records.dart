import 'package:flutter/material.dart';
import 'dashboard.dart';

class TransactionRecordsScreen extends StatelessWidget {
  const TransactionRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,

      appBar: AppBar(
        backgroundColor: beige,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        title: const Text(
          'Transaction Records',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: darkBlue,
          ),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: darkBlue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F7F9),
                borderRadius: BorderRadius.circular(16),
              ),

              child: const Row(
                children: [
                  SizedBox(width: 16),

                  Icon(
                    Icons.search_rounded,
                    color: mediumBlue,
                    size: 21,
                  ),

                  SizedBox(width: 10),

                  Text(
                    'Search transactions',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Filter buttons
            Row(
              children: [
                _buildFilterButton(
                  'All',
                  true,
                ),

                const SizedBox(width: 8),

                _buildFilterButton(
                  'Income',
                  false,
                ),

                const SizedBox(width: 8),

                _buildFilterButton(
                  'Expenses',
                  false,
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Date group
            _buildDateHeader('Today'),

            const SizedBox(height: 10),

            _buildTransaction(
              icon: Icons.shopping_bag_rounded,
              iconColor: red,
              title: 'IT Days Supplies',
              category: 'Event Expenses',
              date: 'Today, 2:35 PM',
              amount: '- ₱2,500.00',
              isExpense: true,
            ),

            _buildTransaction(
              icon: Icons.account_balance_wallet_rounded,
              iconColor: mediumBlue,
              title: 'Membership Collection',
              category: 'Membership Fees',
              date: 'Today, 10:15 AM',
              amount: '+ ₱5,000.00',
              isExpense: false,
            ),

            const SizedBox(height: 24),

            // Yesterday
            _buildDateHeader('Yesterday'),

            const SizedBox(height: 10),

            _buildTransaction(
              icon: Icons.local_drink_rounded,
              iconColor: paleBlue,
              title: 'Free Ice Cream Activity',
              category: 'Student Activities',
              date: 'Yesterday, 1:20 PM',
              amount: '- ₱1,200.00',
              isExpense: true,
            ),

            _buildTransaction(
              icon: Icons.print_rounded,
              iconColor: mediumBlue,
              title: 'Printing Services',
              category: 'Office Supplies',
              date: 'Yesterday, 9:42 AM',
              amount: '- ₱450.00',
              isExpense: true,
            ),

            const SizedBox(height: 24),

            // Earlier
            _buildDateHeader('September 18'),

            const SizedBox(height: 10),

            _buildTransaction(
              icon: Icons.monetization_on_rounded,
              iconColor: darkBlue,
              title: 'Organization Fund',
              category: 'Fund Allocation',
              date: 'September 18, 3:10 PM',
              amount: '+ ₱10,000.00',
              isExpense: false,
            ),

            _buildTransaction(
              icon: Icons.inventory_2_rounded,
              iconColor: red,
              title: 'Event Materials',
              category: 'Event Expenses',
              date: 'September 18, 11:05 AM',
              amount: '- ₱3,250.00',
              isExpense: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }

  // Date heading
  Widget _buildDateHeader(String date) {
    return Text(
      date,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: darkBlue,
      ),
    );
  }

  // Filter button
  Widget _buildFilterButton(
      String text,
      bool selected,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 9,
      ),

      decoration: BoxDecoration(
        color: selected
            ? darkBlue
            : const Color(0xFFF3F7F9),

        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: selected
              ? Colors.white
              : darkBlue,
        ),
      ),
    );
  }

  // Transaction row
  Widget _buildTransaction({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String category,
    required String date,
    required String amount,
    required bool isExpense,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: const Color(0xFFE8EFF2),
        ),
      ),

      child: Row(
        children: [
          // Transaction icon
          Container(
            width: 44,
            height: 44,

            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: iconColor,
              size: 21,
            ),
          ),

          const SizedBox(width: 12),

          // Transaction information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: darkBlue,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  category,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: darkBlue.withOpacity(0.55),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 9,
                    color: darkBlue.withOpacity(0.45),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Amount
          Text(
            amount,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: isExpense
                  ? red
                  : const Color(0xFF27865A),
            ),
          ),
        ],
      ),
    );
  }
}

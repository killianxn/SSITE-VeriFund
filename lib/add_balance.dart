import 'package:flutter/material.dart';
import 'dashboard.dart';

// COLORS
const Color darkText = Color(0xFF303030);
const Color greyText = Color(0xFF777777);

class AddBalanceScreen extends StatelessWidget {
  const AddBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,

      body: SafeArea(
        child: Column(
          children: [

            // ==========================
            // TOP BAR
            // ==========================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),

              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),

                    child: Container(
                      width: 42,
                      height: 42,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: const Icon(
                        Icons.arrow_back,
                        color: darkBlue,
                        size: 22,
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Text(
                    'ADD BALANCE',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: darkBlue,
                    ),
                  ),
                ],
              ),
            ),

            // ==========================
            // FORM
            // ==========================

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  30,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // PAYMENT INFORMATION
                    _sectionTitle('Payment Information'),
                    const SizedBox(height: 10),

                    _card(
                      Column(
                        children: [

                          _textField(
                            label: 'Amount',
                            hint: 'Enter membership fee',
                            prefix: '₱ ',
                          ),

                          const SizedBox(height: 16),

                          _textField(
                            label: 'Student / Member Name',
                            hint: 'Enter student or member name',
                          ),

                          const SizedBox(height: 16),

                          _textField(
                            label: 'Student / Member ID',
                            hint: 'Enter student or member ID',
                          ),

                          const SizedBox(height: 16),

                          _dropdown(
                            label: 'Payment Type',
                            hint: 'Select Payment Type',
                            items: const [
                              '<Membership Fee>',
                              '<Registration Fee>',
                              '<Other Payment>',
                            ],
                          ),

                          const SizedBox(height: 16),

                          _dropdown(
                            label: 'Payment Method',
                            hint: 'Select Payment Method',
                            items: const [
                              '<Cash>',
                              '<GCash>',
                              '<Bank Transfer>',
                              '<Other>',
                            ],
                          ),

                          const SizedBox(height: 16),

                          _textField(
                            label: 'Date of Payment',
                            hint: 'Select date',
                            suffixIcon: Icons.calendar_today_outlined,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                    // ==========================
                    // BALANCE PREVIEW
                    // ==========================

                    _sectionTitle('Balance Preview'),
                    const SizedBox(height: 10),

                    _card(
                      Column(
                        children: [

                          _balanceRow(
                            'Remaining Funds',
                            '₱ <Balance>',
                          ),

                          const SizedBox(height: 12),

                          _balanceRow(
                            'Payment Amount',
                            '+ ₱ <Payment>',
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),

                            child: Divider(
                              color: paleBlue,
                            ),
                          ),

                          _balanceRow(
                            'New Remaining Funds',
                            '₱ <Balance>',
                            bold: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ==========================
                    // ADDITIONAL INFORMATION
                    // ==========================

                    _sectionTitle('Additional Information'),
                    const SizedBox(height: 10),

                    _card(
                      _textField(
                        label: 'Notes',
                        hint:
                        'Additional information about this payment',
                        maxLines: 4,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ==========================
                    // SUBMIT
                    // ==========================

                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Add payment to balance
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: darkBlue,
                          foregroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        child: const Text(
                          'Add Balance',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================
  // REUSABLE WIDGETS
  // ==========================

  static Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: darkBlue,
      ),
    );
  }

  static Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: darkBlue,
      ),
    );
  }

  static Widget _card(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: child,
    );
  }

  static Widget _textField({
    required String label,
    required String hint,
    String? prefix,
    IconData? suffixIcon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _label(label),

        const SizedBox(height: 7),

        TextField(
          maxLines: maxLines,

          decoration: InputDecoration(
            hintText: hint,
            prefixText: prefix,

            hintStyle: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.grey,
              fontSize: 13,
            ),

            suffixIcon: suffixIcon != null
                ? Icon(
              suffixIcon,
              color: darkBlue,
              size: 20,
            )
                : null,

            filled: true,
            fillColor: paleBlue,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: mediumBlue,
                width: 1.5,
              ),
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),
          ),
        ),
      ],
    );
  }

  static Widget _dropdown({
    required String label,
    required String hint,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _label(label),

        const SizedBox(height: 7),

        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,

            filled: true,
            fillColor: paleBlue,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: mediumBlue,
                width: 1.5,
              ),
            ),
          ),

          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),

          onChanged: (value) {},
        ),
      ],
    );
  }

  static Widget _photoButton(
      IconData icon,
      String label,
      ) {
    return GestureDetector(
      onTap: () {
        // TODO: Open camera/gallery
      },

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 11,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [

            Icon(
              icon,
              size: 19,
              color: darkBlue,
            ),

            const SizedBox(width: 7),

            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _ocrResult(
      String label,
      String value,
      ) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 10,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 11,
      ),

      decoration: BoxDecoration(
        color: paleBlue,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: darkText,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              color: greyText,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _balanceRow(
      String label,
      String value, {
        bool bold = false,
      }) {
    return Row(
      children: [

        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13,
            fontWeight: bold
                ? FontWeight.w700
                : FontWeight.w600,
            color: darkText,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: bold
                ? FontWeight.w800
                : FontWeight.w600,
            color: bold ? darkBlue : greyText,
          ),
        ),
      ],
    );
  }
}
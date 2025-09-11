import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isEditing = false;

  // Address form controllers
  final TextEditingController firstNameController =
      TextEditingController(text: "John");
  final TextEditingController lastNameController =
      TextEditingController(text: "Doe");
  final TextEditingController companyController =
      TextEditingController(text: "CNIT Pvt Ltd");
  final TextEditingController countryController =
      TextEditingController(text: "United Arab Emirates");
  final TextEditingController streetController =
      TextEditingController(text: "123 Green Street");
  final TextEditingController cityController =
      TextEditingController(text: "Dubai");
  final TextEditingController stateController =
      TextEditingController(text: "Dubai");
  final TextEditingController pinController =
      TextEditingController(text: "00000");
  final TextEditingController phoneController =
      TextEditingController(text: "+971 123456789");
  final TextEditingController emailController =
      TextEditingController(text: "john.doe@email.com");

  // Cooking Instructions
  final TextEditingController cookingInstructionsController =
      TextEditingController();

  // Delivery scheduling
  DateTime? selectedDate;
  String? selectedSlot;

  final List<String> deliverySlots = [
    "09:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "12:00 PM - 01:00 PM",
    "01:00 PM - 02:00 PM",
    "02:00 PM - 03:00 PM",
    "03:00 PM - 04:00 PM",
    "04:00 PM - 05:00 PM",
    "05:00 PM - 06:00 PM",
    "06:00 PM - 07:00 PM",
    "07:00 PM - 08:00 PM",
  ];

  // Disabled dates and slots
  final List<DateTime> disabledDates = [
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 3)),
  ];

  final List<String> disabledSlots = [
    "12:00 PM - 01:00 PM",
    "05:00 PM - 06:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    bool canProceed = selectedDate != null && selectedSlot != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Delivery Address
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Delivery Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: Text(isEditing ? "Save" : "Edit"),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: isEditing
                  ? Column(
                      children: [
                        buildTextField("First Name *", firstNameController),
                        buildTextField("Last Name *", lastNameController),
                        buildTextField(
                            "Company Name (Optional)", companyController),
                        buildTextField("Country / Region *", countryController),
                        buildTextField("Street Address *", streetController),
                        buildTextField("Town / City *", cityController),
                        buildTextField("State *", stateController),
                        buildTextField("PIN Code *", pinController),
                        buildTextField("Phone *", phoneController),
                        buildTextField("Email Address *", emailController),
                      ],
                    )
                  : Text(
                      "${firstNameController.text} ${lastNameController.text}\n"
                      "${companyController.text.isNotEmpty ? "${companyController.text}\n" : ""}"
                      "${streetController.text}, ${cityController.text}, ${stateController.text}\n"
                      "${countryController.text} - ${pinController.text}\n"
                      "Phone: ${phoneController.text}\n"
                      "Email: ${emailController.text}",
                      style: const TextStyle(fontSize: 16),
                    ),
            ),
            const SizedBox(height: 20),

            /// Order Summary
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dry Fruit Kheer (500 ml)"),
                      Text("₹460.00"),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Charges"),
                      Text("₹50.00"),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹510.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Cooking Instructions
            const Text(
              "Cooking Instructions (Optional)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: cookingInstructionsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "E.g. Make it less spicy, extra ghee, etc.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 20),

            /// Delivery Scheduling
            const Text(
              "Schedule Delivery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Delivery Date
            const Text(
              "Delivery Date *",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  DateTime date = DateTime.now().add(Duration(days: index + 1));
                  bool isDisabled = disabledDates.any((d) =>
                      d.day == date.day &&
                      d.month == date.month &&
                      d.year == date.year);
                  String formattedDate =
                      "${date.day} ${DateFormat('EEE').format(date).toUpperCase()} ${DateFormat('MMM').format(date).toUpperCase()}";
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(formattedDate, textAlign: TextAlign.center),
                      selected: selectedDate != null &&
                          selectedDate!.day == date.day &&
                          selectedDate!.month == date.month &&
                          selectedDate!.year == date.year,
                      onSelected: isDisabled
                          ? null
                          : (_) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                      selectedColor: Colors.green,
                      backgroundColor: isDisabled
                          ? Colors.grey[300]
                          : Colors.grey[200],
                      labelStyle: TextStyle(
                          color: isDisabled
                              ? Colors.grey
                              : selectedDate != null &&
                                      selectedDate!.day == date.day &&
                                      selectedDate!.month == date.month &&
                                      selectedDate!.year == date.year
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),

            // Delivery Slot
            const Text(
              "Delivery Slot *",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: deliverySlots.map((slot) {
                  bool isDisabled = disabledSlots.contains(slot);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(slot),
                      selected: selectedSlot == slot,
                      onSelected: isDisabled
                          ? null
                          : (_) {
                              setState(() {
                                selectedSlot = slot;
                              });
                            },
                      selectedColor: Colors.green,
                      backgroundColor: isDisabled
                          ? Colors.grey[300]
                          : Colors.grey[200],
                      labelStyle: TextStyle(
                          color: isDisabled
                              ? Colors.grey
                              : selectedSlot == slot
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),

            /// Place Order Button (disabled if date/slot not selected)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: canProceed ? Colors.green : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: canProceed
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Order placed on ${DateFormat('dd MMM EEE').format(selectedDate!)} during $selectedSlot with instructions: ${cookingInstructionsController.text}",
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Place Order",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable TextField builder
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

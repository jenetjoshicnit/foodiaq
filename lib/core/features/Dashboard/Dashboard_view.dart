import 'package:flutter/material.dart';
import 'package:foodiq/widgets/foodcard.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDashboard extends StatefulWidget {
  const FoodDashboard({super.key});

  @override
  State<FoodDashboard> createState() => _FoodDashboardState();
}

class _FoodDashboardState extends State<FoodDashboard> {
  // final ScrollController _scrollController = ScrollController();
  // bool isAtTop = false;
  final List<Map<String, String>> foodItems = [
    {"image": "assets/keralafood2.jpg", "title": "Kerala"},
    {"image": "assets/odishafood.jpg", "title": "Odisha"},
    {"image": "assets/keralafood3.jpg", "title": "Kerala"},
    {"image": "assets/keralafood.png", "title": "Kerala"},
  ];
  // void _scrollToggle() {
  //   if (isAtTop) {
  //     _scrollController.animateTo(
  //       300,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   } else {
  //     _scrollController.animateTo(
  //       0,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(() {
  //     setState(() => isAtTop = _scrollController.offset <= 0);
  //   });
  // }
  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        //  _scrollToggle,
                        // icon: Icon(
                        //   isAtTop ? Icons.arrow_downward : Icons.arrow_upward,
                        //   color: Colors.white,
                        // ),
                        label: const Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Homemade meals prepared with love. Richest ingredients.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //  center icon + text
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center, //  center text inside
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Menu",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AspectRatio(
                aspectRatio: 3 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/poster1.jpg", fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                "Taste from every corner of India",
                textAlign: TextAlign.center,
                style: GoogleFonts.novaCut(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: foodItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, i) => FoodCard(
                title: foodItems[i]["title"]!,
                imageUrl: foodItems[i]["image"]!,
              ),
            ),

            const SizedBox(height: 20),

            // What we offer
            Center(
              child: Text(
                "What we offer",
                style: GoogleFonts.novaCut(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/whatweoffer3.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/whatweoffer2.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/whatweoffer1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Offers Section
            Center(
              child: Text(
                "Our Offers",
                style: GoogleFonts.novaCut(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/offerpicture.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

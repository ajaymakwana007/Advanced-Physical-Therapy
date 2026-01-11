import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APT Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Color(0xFFF8FAFC),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            FeaturesSection(),
            FaqSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.6, // Flexible height
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'APT - Advanced Project Tool',
              style: GoogleFonts.poppins(
                fontSize: screenWidth > 1200 ? 48 : screenWidth > 600 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Modern solution for your project management needs',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth > 600 ? 20 : 16,
                  color: Colors.white70,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: screenWidth > 600 ? 200 : 160,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth > 600 ? 18 : 16,
                    fontWeight: FontWeight.bold,
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

class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: 60,
      ),
      child: Column(
        children: [
          Text(
            'Features',
            style: GoogleFonts.poppins(
              fontSize: screenWidth > 768 ? 36 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: screenWidth > 768 ? 64 : 40),
          screenWidth > 768
              ? Row(
            children: [
              Expanded(child: FeatureCard('Real-time Sync', Icons.sync, 'Live updates across all devices')),
              SizedBox(width: 32),
              Expanded(child: FeatureCard('Team Collaboration', Icons.group, 'Work together seamlessly')),
              SizedBox(width: 32),
              Expanded(child: FeatureCard('Analytics', Icons.analytics, 'Track your progress')),
            ],
          )
              : Column(
            children: [
              FeatureCard('Real-time Sync', Icons.sync, 'Live updates across all devices'),
              SizedBox(height: 24),
              FeatureCard('Team Collaboration', Icons.group, 'Work together seamlessly'),
              SizedBox(height: 24),
              FeatureCard('Analytics', Icons.analytics, 'Track your progress'),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String desc;

  FeatureCard(this.title, this.icon, this.desc);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth > 768 ? 32 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon,
              size: screenWidth > 768 ? 64 : 48,
              color: Color(0xFF6366F1)
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: screenWidth > 768 ? 24 : 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            desc,
            style: GoogleFonts.poppins(
              fontSize: screenWidth > 768 ? 16 : 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FaqSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FAQ',
            style: GoogleFonts.poppins(
              fontSize: screenWidth > 768 ? 36 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 40),
          ...List.generate(4, (index) => FaqItem('Question ${index + 1}?')),
        ],
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  FaqItem(this.question);

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: ExpansionTile(
        onExpansionChanged: (expanded) => setState(() => _isExpanded = expanded),
        leading: Icon(Icons.help_outline,
          color: Color(0xFF6366F1),
          size: 28,
        ),
        title: Text(
          widget.question,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        childrenPadding: EdgeInsets.all(20),
        collapsedBackgroundColor: Colors.transparent,
        children: [
          Text(
            'This is the detailed answer to ${widget.question}',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1,
        vertical: 40,
      ),
      color: Color(0xFF1E293B),
      child: Text(
        '© 2026 APT. All rights reserved.',
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

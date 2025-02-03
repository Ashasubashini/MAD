import 'package:flutter/material.dart';

class BranchesPage extends StatelessWidget {
  const BranchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Branches'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/map.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore Our Branches',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Branch Cards
            BranchCard(
              imagePath: 'images/ogf.jpg',
              branchName: 'One Gallefacce',
              location: '1A Centre Road, Colombo 00200',
            ),
            BranchCard(
              imagePath: 'images/havelock.jpeg',
              branchName: 'Havelock city',
              location: '324-10 Havelock Rd, Colombo 00500',
            ),
            BranchCard(
              imagePath: 'images/vivo.png',
              branchName: 'Vivo city',
              location: '1 HarbourFront Walk, Singapore 098585',
            ),
            BranchCard(
              imagePath: 'images/Screenshot 2025-01-19 201846.png',
              branchName: 'Destiny Mall',
              location: 'Syracuse, New York',
            ),
            BranchCard(
              imagePath: 'images/Screenshot 2025-01-19 202017.png',
              branchName: 'westfield Mall',
              location: 'Montfichet Rd, London E20 1EJ, UK',
            ),
          ],
        ),
      ),
    );
  }
}

class BranchCard extends StatelessWidget {
  final String imagePath;
  final String branchName;
  final String location;

  const BranchCard({
    super.key,
    required this.imagePath,
    required this.branchName,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    branchName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

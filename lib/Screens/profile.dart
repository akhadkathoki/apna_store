import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apna_store/img_file.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for the input fields
  final TextEditingController nameController =
      TextEditingController(text: 'Nitesh Kumar Sharma');
  final TextEditingController emailController =
      TextEditingController(text: 'abhishek@gmail.com');
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();

  // Edit mode flag for each section
  bool isEditingPersonalInfo = false;
  bool isEditingLocation = false;
  bool isEditingOtherDetails = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4F2D19),
        toolbarHeight: 60,
        foregroundColor: const Color.fromARGB(255, 255, 224, 187),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          // Logout Button
          IconButton(
            onPressed: () {
              // Add logout functionality here
              auth.signOut().then((value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                Utils().toasMessage("Logged Out Successfully");
              }).onError((error, StackTrace) {
                Utils().toasMessage(error.toString());
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 253, 234, 211),
            ),
          ),
        ],
        elevation: 10,
      ),
    
      backgroundColor: const Color(0xFFFAE3C6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Picture Section
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Color.fromARGB(255, 155, 117, 70),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(profile),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          // Add profile picture update functionality here
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color.fromARGB(255, 253, 234, 211),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // User Details Section
              Text(
                'Nitesh Kumar Sharma',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'nitesh@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: theme.primaryColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 50),

              // Personal Information Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F2D19),
                    ),
                  ),
                  IconButton(
                    icon:
                        Icon(isEditingPersonalInfo ? Icons.check : Icons.edit),
                    color: const Color(0xFF4F2D19),
                    onPressed: () {
                      setState(() {
                        isEditingPersonalInfo = !isEditingPersonalInfo;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: nameController,
                          enabled: isEditingPersonalInfo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: emailController,
                          enabled: isEditingPersonalInfo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: ageController,
                          enabled: isEditingPersonalInfo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: genderController,
                          enabled: isEditingPersonalInfo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: phoneNumberController,
                          enabled: isEditingPersonalInfo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Location Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F2D19),
                    ),
                  ),
                  IconButton(
                    icon: Icon(isEditingLocation ? Icons.check : Icons.edit),
                    color: const Color(0xFF4F2D19),
                    onPressed: () {
                      setState(() {
                        isEditingLocation = !isEditingLocation;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: countryController,
                          enabled: isEditingLocation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'State',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: stateController,
                          enabled: isEditingLocation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'District',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: districtController,
                          enabled: isEditingLocation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Other Details Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Other Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4F2D19),
                    ),
                  ),
                  IconButton(
                    icon:
                        Icon(isEditingOtherDetails ? Icons.check : Icons.edit),
                    color: const Color(0xFF4F2D19),
                    onPressed: () {
                      setState(() {
                        isEditingOtherDetails = !isEditingOtherDetails;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Other Detail 1',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: TextEditingController(),
                          enabled: isEditingOtherDetails,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Other Detail 2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 9,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.15),
                        child: TextFormField(
                          controller: TextEditingController(),
                          enabled: isEditingOtherDetails,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Logic to save all the updated details
                  setState(() {
                    isEditingPersonalInfo = false;
                    isEditingLocation = false;
                    isEditingOtherDetails = false;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

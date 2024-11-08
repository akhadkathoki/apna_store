import 'package:flutter/material.dart';
import 'package:apna_store/img_file.dart';

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
            },
            icon: Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 253, 234, 211),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: Color.fromARGB(255, 253, 234, 211),
                    fontSize: 15,
                  ),
                ),
              ],
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
              _buildProfilePicture(theme),

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
              _buildSectionHeader(
                  title: 'Personal Information',
                  isEditing: isEditingPersonalInfo,
                  onEditTap: () {
                    setState(() {
                      isEditingPersonalInfo = !isEditingPersonalInfo;
                    });
                  }),
              _buildLabeledTextField(
                  label: 'Full Name',
                  controller: nameController,
                  enabled: isEditingPersonalInfo),
              _buildLabeledTextField(
                  label: 'Email',
                  controller: emailController,
                  enabled: isEditingPersonalInfo),
              _buildLabeledTextField(
                  label: 'Age',
                  controller: ageController,
                  enabled: isEditingPersonalInfo),
              _buildLabeledTextField(
                  label: 'Gender',
                  controller: genderController,
                  enabled: isEditingPersonalInfo),
              _buildLabeledTextField(
                  label: 'Phone Number',
                  controller: phoneNumberController,
                  enabled: isEditingPersonalInfo),

              const SizedBox(height: 20),

              // Location Section
              _buildSectionHeader(
                  title: 'Location',
                  isEditing: isEditingLocation,
                  onEditTap: () {
                    setState(() {
                      isEditingLocation = !isEditingLocation;
                    });
                  }),
              _buildLabeledTextField(
                  label: 'Country',
                  controller: countryController,
                  enabled: isEditingLocation),
              _buildLabeledTextField(
                  label: 'State',
                  controller: stateController,
                  enabled: isEditingLocation),
              _buildLabeledTextField(
                  label: 'District',
                  controller: districtController,
                  enabled: isEditingLocation),

              const SizedBox(height: 20),

              // Other Details Section
              _buildSectionHeader(
                  title: 'Other Details',
                  isEditing: isEditingOtherDetails,
                  onEditTap: () {
                    setState(() {
                      isEditingOtherDetails = !isEditingOtherDetails;
                    });
                  }),
              _buildLabeledTextField(
                  label: 'Other Detail 1',
                  controller: TextEditingController(),
                  enabled: isEditingOtherDetails),
              _buildLabeledTextField(
                  label: 'Other Detail 2',
                  controller: TextEditingController(),
                  enabled: isEditingOtherDetails),

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
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
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

  Widget _buildProfilePicture(ThemeData theme) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color.fromARGB(255, 155, 117, 70),
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
    );
  }

  Widget _buildSectionHeader(
      {required String title,
      required bool isEditing,
      required Function() onEditTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F2D19),
          ),
        ),
        IconButton(
          icon: Icon(isEditing ? Icons.check : Icons.edit),
          color: const Color(0xFF4F2D19),
          onPressed: onEditTap,
        ),
      ],
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    required TextEditingController controller,
    required bool enabled,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F2D19),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              elevation: 9,
              shadowColor:
                  const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
              child: TextFormField(
                controller: controller,
                enabled: enabled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

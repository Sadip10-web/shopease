import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/emailfield.dart';
import 'package:shopease/widgets/fillUp_widget.dart';
import 'package:shopease/widgets/title_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ProfileAvatar
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: Color(0xFF6D28FF),
                          child: Icon(
                            Icons.account_circle_sharp,
                            size: 150,
                            color: Color.fromARGB(255, 124, 196, 218),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 5,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF6D28FF),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Change Photo",
                      style: TextStyle(
                        color: Color(0xFF6D28FF),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Name
              TitleWidget(title: "Name"),
              Gap(12),
              FillupWidget(
                placeHolder: "John Doe",
                icon: Icons.person,
                keyboardType: TextInputType.text,
              ),

              Gap(30),

              // Email
              TitleWidget(title: "Email"),
              Gap(12),
              FillupWidget(
                placeHolder: "john@gmail.com",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              Gap(30),

              TitleWidget(title: "Phone Number"),
              Gap(8),
              FillupWidget(
                placeHolder: "+977 9800000000",
                icon: Icons.phone,
                keyboardType: TextInputType.number,
              ),
              Gap(30),

              TitleWidget(title: "Date of Birth"),
              Gap(8),
              FillupWidget(
                placeHolder: "Jan 01, 1995",
                icon: Icons.date_range,
                keyboardType: TextInputType.datetime,
              ),
              Gap(30),

              TitleWidget(title: "Gender"),
              Gap(8),
              FillupWidget(
                placeHolder: "Male",
                icon: Icons.person,
                keyboardType: TextInputType.text,
              ),
              Gap(30),

              TitleWidget(title: "Address"),
              Gap(8),
              FillupWidget(
                placeHolder: "Pokhara, Kaski",
                icon: Icons.location_on,
                keyboardType: TextInputType.text,
              ),
              Gap(30),

              ButtonWidget(
                buttonText: "Save Changes",
                backgroundColor: Color(0xFF6D28FF),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/widgets/bottomNavigationBar.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/fillUp_widget.dart';

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
              Gap(12),

              Text(
                "Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              FillupWidget(
                icon: Icons.person,
                keyboardType: TextInputType.text,
                hintText: 'John Doe',
              ),

              Gap(30),

              //Email
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(12),
              FillupWidget(
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                hintText: 'john@gmail.com',
              ),

              //PhoneNumber
              Gap(30),

              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(8),
              FillupWidget(
                icon: Icons.phone,
                keyboardType: TextInputType.number,
                hintText: '+977 980000000',
              ),

              Gap(30),

              //DOB
              Text(
                "Date of Birth",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(8),
              FillupWidget(
                icon: Icons.date_range,
                keyboardType: TextInputType.datetime,
                hintText: 'Jan 01, 1995',
              ),

              Gap(30),

              //Gender
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(8),
              FillupWidget(
                icon: Icons.person,
                keyboardType: TextInputType.text,
                hintText: 'Male',
              ),

              Gap(30),

              //Address
              Text(
                "Address",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(8),
              FillupWidget(
                icon: Icons.location_on,
                keyboardType: TextInputType.text,
                hintText: 'Pokhara, Kaski',
              ),

              Gap(30),

              //Button
              ButtonWidget(
                buttonText: "Save Changes",
                backgroundColor: Color(0xFF6D28FF),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
        ),

      // buttom navigation bar added by Pankaj
        
        extendBody: true,
        bottomNavigationBar: ButtomNavigationBar(),

      // navigation bar ends here


      ),
    );
  }
}

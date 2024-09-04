import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final String gender_name;
  final IconData ico_n;
  final bool isSelected;
  final VoidCallback onTap;

  GenderWidget({
    required this.gender_name,
    required this.ico_n,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: isSelected ? Color(0xFF1c1c32) : Color(0xFF141427),
          ),
          child: Column(
            children: [
              Icon(
                ico_n,
                color: Colors.white,
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  gender_name,
                  style: TextStyle(color: Color(0xFF71727e), fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget buildTimerCard({required String time, required String header}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            time,
            style: const TextStyle(fontSize: 30, color: Colors.purple),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(header),
      ],
    );

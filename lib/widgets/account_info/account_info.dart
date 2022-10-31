import 'package:flutter/material.dart';

Widget accountInfo ({
  required String nome,
  required String tipo,
  required double saldo,
  required String assetImage,
 })
{
  return Row(
       children: [
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
                    assetImage,
                    height:48,
                    width:48,
                    ),
          ),

          const SizedBox(width: 8),
          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                        nome,
                        style: const TextStyle(
                        fontFamily:'Inter',
                        fontWeight:FontWeight.w500,
                        fontSize: 16,
                        color: Color (0xFF2F595B),
                      ),
                    ),
                 Text(
                      tipo,
                      style: const TextStyle(
                      fontFamily:'Inter',
                      fontWeight:FontWeight.w500,
                      fontSize: 14,
                      color: Color (0xFF2F595B),
                      ),
                  ),
                  ],
                ),
          const SizedBox(width: 29),
          Text(
                  "R\$ $saldo",
                  style: const TextStyle(
                    fontFamily:'Inter',
                    fontWeight:FontWeight.w700,
                    fontSize: 16,
                    color: Color (0xFF2F595B),
                  ),
                ),
              ],
          );
}
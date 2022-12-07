import 'package:flutter/material.dart';

Widget despesasAtrasadas() {
  return Column(
  children:[
    Padding(
      padding: const EdgeInsets.only(top:16, bottom:8),
      child: Row(
      children:const [
      SizedBox(width: 16),
      Text('Despesa 1',
        style:TextStyle (
        color: Color(0xff2F595B),
        fontSize:18,
        fontWeight: FontWeight.w400,
      ),),
      SizedBox(width: 32),
      Text('R\$ 100,00',
        style:TextStyle (
          color: Color(0xff2F595B),
          fontSize:18,
          fontWeight: FontWeight.w400,
        ),),
      Spacer(),
      Text ('10/12',
        style:TextStyle (
          color: Color(0xff2F595B),
          fontSize:18,
          fontWeight: FontWeight.w400,
        ),),
      SizedBox(width: 16),
   ]
),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom:8),
      child: Row(
          children:const [
            SizedBox(width: 16),
            Text('Despesa 2',
              style:TextStyle (
                color: Color(0xff2F595B),
                fontSize:18,
                fontWeight: FontWeight.w400,
              ),),
            SizedBox(width: 32),
            Text('R\$ 34,00',
              style:TextStyle (
                color: Color(0xff2F595B),
                fontSize:18,
                fontWeight: FontWeight.w400,
              ),),
            Spacer(),
            Text ('10/12',
              style:TextStyle (
                color: Color(0xff2F595B),
                fontSize:18,
                fontWeight: FontWeight.w400,
              ),),
            SizedBox(width: 16),
          ]
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom:8),
      child: Row(
          children:const [
            SizedBox(width: 16),
            Text('Despesa 3',
              style:TextStyle (
                color: Color(0xff2F595B),
                fontSize:18,
                fontWeight: FontWeight.w400,
              ),),
            SizedBox(width: 32),
            Text('R\$ 1455,20',
              style:TextStyle (
                color: Color(0xff2F595B),
                fontSize:18,
                fontWeight: FontWeight.w400,
              ),),
            Spacer(),
            Text ('10/12',
              style:TextStyle (
                color: Color(0xff2F595B),
                fontSize:18,
                fontWeight: FontWeight.w400,
              ),),
            SizedBox(width: 16),
          ]
      ),
    ),
  ]
  );
}

Widget despesasEmDia() {
  return Column(
      children:[
        Padding(
          padding: const EdgeInsets.only(top:16, bottom:8),
          child: Row(
              children: const [
                SizedBox(width: 16),
                Text('Despesa 1',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(width: 32),
                 Text('R\$ 100,00',
                  style:TextStyle (
                    color:  Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                Spacer(),
                Text ('12/12',
                  style:TextStyle (
                    color:  Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(width: 16),
              ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:8),
          child: Row(
              children:const [
                SizedBox(width: 16),
                Text('Despesa 2',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(width: 32),
                Text('R\$ 34,00',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                Spacer(),
                Text ('10/12',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(width: 16),
              ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:8),
          child: Row(
              children:const [
                SizedBox(width: 16),
                Text('Despesa 3',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(width: 32),
                Text('R\$ 1455,20',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                Spacer(),
                Text ('10/12',
                  style:TextStyle (
                    color: Color(0xff2F595B),
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                  ),),
                SizedBox(width: 16),
              ]
          ),
        ),
      ]
  );
}
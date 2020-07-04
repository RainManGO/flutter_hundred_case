/*
 * @Author: ZY 
 * @Date: 2020-04-24 15:06:54 
 * @Last Modified by: ZY
 * @Last Modified time: 2020-04-25 09:21:33
 */

import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  PageScaffold({Key key,this.title,this.body,this.padding}):super(key:key);
  final String title;
  final Widget body;
  final bool padding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: padding ? 
        Padding(
          padding: const EdgeInsets.all(16),
          child: body,)
          :body,
    );
  }
}

import 'dart:developer';

import 'package:demo_social_app/api_services/base_api.dart';
import 'package:demo_social_app/data_models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final PostDatum state;

  const PostCard({Key? key, required this.state}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.state.attachment!.isNotEmpty)
          Image.network(widget.state.attachment!),
          if(widget.state.caption!.isNotEmpty)
            Text(widget.state.caption!,style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),
            Row(
            children: [
              IconButton(
                onPressed: () {
                  // setState((v) {
                  //   widget.state
                  // });
                },
                icon: widget.state.like == null
                    ? const Icon(Icons.thumb_up_alt_outlined)
                    : const Icon(Icons.thumb_up_alt),
              ),
              // chat_bubble_sharp

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }

}


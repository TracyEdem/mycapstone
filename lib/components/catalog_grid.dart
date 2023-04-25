import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screens/image_view.dart';

class GridWidget extends StatelessWidget {

  
  const GridWidget({
    Key? key, 
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final List<GridItem> _items = [
    GridItem(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLNYr3DSmVzj6PP0Ll5QztClHfgPf9v8QH-aTVBDGQkX45zCBk27-TTOGweV-lOBH4LyA&usqp=CAU',
        "Red and Black Plaid shirt"),
    GridItem(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ__MdUnm5AGr4P6FTYaoUqRAkeObyvOEEJIQ&usqp=CAU',
        "Fitted Ankara Skirt"),
    GridItem(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVS4NlodpqCY1z6hFJHFkkNIvWQlZi__vBcg&usqp=CAU',
        "Red gym shorts"),
    GridItem(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzwY_WntHqc_JKR9wnSDyC5PayMwJMua0GDg&usqp=CAU',
        "Black and White Shirt"),
];

    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RouteTwo(
                    image: _items[index].image,
                    name: _items[index].name),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_items[index].image),
              ),
            ),
          ),
            );
          },
        //   ),
        // ),
    );
  }
}


class GridItem {
  final String image;
  final String name;
  GridItem(this.image, this.name);
}
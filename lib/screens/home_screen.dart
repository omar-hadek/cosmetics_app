import 'package:flutter/material.dart';

const String primary = "primary";
const String white = "white";
const String secondary = "secondary";
const Map<String, Color> myColors = {
  primary: Color.fromRGBO(226, 115, 138, 1),
  white: Colors.white,
  secondary: Color.fromRGBO(247, 225, 227, 1),
};

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors[primary],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: myColors[primary],
                size: 34.0,
              ),
              onPressed: () {},
            ),
          ),
          title: Center(
            child: Text('hello world'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20.0),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: myColors[primary],
                  size: 34.0,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: myColors[white],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Text('Cosmetics that everyone loves!',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                        overflow: TextOverflow.clip),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.only(bottom: 10.0, left: 10.0, top: 30.0),
                      child: Expanded(
                        child: LayoutBuilder(
                          builder: (context, contraints) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _Product(
                                  height: contraints.maxHeight * .85,
                                  price: 100.0,
                                  favoritecallback: () =>
                                      print('main item favorited'),
                                  imagePath: 'assets/images/makeup1.png',
                                  addCallback: () => print('maink item added'),
                                ),
                                Column(
                                  children: [
                                    _Product(
                                      height: contraints.maxHeight * .385,
                                      price: 75.0,
                                      favoritecallback: () =>
                                          print('2nd item favorited'),
                                      imagePath: 'assets/images/makeup2.png',
                                      addCallback: () =>
                                          print('2nd item added'),
                                    ),
                                    _Product(
                                      height: contraints.maxHeight * .385,
                                      price: 75.0,
                                      favoritecallback: () =>
                                          print('3d item favorited'),
                                      imagePath: 'assets/images/makeup3.png',
                                      addCallback: () => print('3d item added'),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 25.0,
                    top: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended',
                        style: TextStyle(
                          color: myColors[white],
                          fontSize: 20.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: myColors[secondary],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward,
                            size: 15.0,
                            color: myColors[primary],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, size) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 14.0,
                            right: 20.0,
                            bottom: 14.0,
                            child: Container(
                              height: size.maxHeight * .8,
                              width: size.maxWidth * .83,
                              decoration: BoxDecoration(
                                color: myColors[white],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60.0),
                                  bottomLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image(
                                    image:
                                        AssetImage('assets/images/makeup4.png'),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 13.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              'Multi Shades Friendly lip glossih all colors Available in all shades',
                                              overflow: TextOverflow.clip),
                                          Text(
                                            '\$200.0',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FavButton(
                                        favoritecallback: () =>
                                            print('bottom Producted favorited'),
                                      ),
                                      AddButton(
                                        addCallback: () =>
                                            print('bottom Producted added'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Product extends StatelessWidget {
  final double height;
  final double price;
  final Function favoritecallback;
  final String imagePath;
  final Function addCallback;
  const _Product(
      {Key key,
      @required this.height,
      @required this.price,
      @required this.favoritecallback,
      @required this.imagePath,
      @required this.addCallback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              height: height,
              image: AssetImage(imagePath),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                AddButton(addCallback: addCallback),
              ],
            ),
          ],
        ),
        FavButton(favoritecallback: favoritecallback),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.addCallback,
  }) : super(key: key);

  final Function addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addCallback,
      child: Container(
        child: Icon(
          Icons.add,
          size: 20.0,
          color: myColors[primary],
        ),
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: myColors[secondary],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class FavButton extends StatelessWidget {
  const FavButton({
    Key key,
    @required this.favoritecallback,
  }) : super(key: key);

  final Function favoritecallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite_border,
        color: myColors[primary],
      ),
      onPressed: favoritecallback,
    );
  }
}

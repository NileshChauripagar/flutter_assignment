import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/bloc/store/store_bloc.dart';
import 'package:flutterassignment/bloc/store/store_state.dart';

class StoreScreen extends StatefulWidget {
  static const route = 'StoreScreen';

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _current = 0;
  bool _isSlideShow = false;
  CarouselController _carouselController = CarouselController();

  ///Build UI
  Widget _buildUI(
    BuildContext context,
  ) {
    var storeBloc = BlocProvider.of<StoreBloc>(context);
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.8,
              autoPlay: _isSlideShow,
              initialPage: _current,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(seconds: 5),
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                _current = index;
                setState(() {});
              }),
          items: storeBloc.storeData.map((result) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    AppBar(
                      title: Text(
                        '${result.storeName}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: result.image,
                      placeholder: (
                        context,
                        url,
                      ) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        padding: EdgeInsets.all(5)),
                    SizedBox(
                      height: 18.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        result?.title ?? '',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: storeBloc.storeData.map((result) {
            var index = storeBloc.storeData.indexOf(result);
            return GestureDetector(
              onTap: () {
                _current = index;
                _carouselController.jumpToPage(_current);
                setState(() {});
              },
              child: Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            );
          }).toList(),
        ),
        OutlineButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.blue, width: 3, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            _isSlideShow = !_isSlideShow;

            if (_isSlideShow) {
              _current = 0;
            }
            setState(() {});
          },
          child: Text(
            _isSlideShow ? '  End Slide Show   ' : "  Slide Show  ",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StoreBloc, StoreState>(
        listener: (context, authState) {
          ///non ui
          if (authState is StoreStateLoaded) {}
        },
        child: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            ///UI
            if (state is StoreStateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is StoreStateLoaded) {
              return _buildUI(context);
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

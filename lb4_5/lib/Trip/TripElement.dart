import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripElement extends StatelessWidget {

  final String name;
  final String seasonAndDuration;
  final Color textColor;
  final String backgroundImageName;
  final String seasonImage;
  final List<String> peopleImages;

  const TripElement(
      {
        Key key,
        this.name,
        this.textColor,
        this.seasonAndDuration,
        this.backgroundImageName,
        this.seasonImage,
        this.peopleImages,
      } ) : super(key: key);

  Positioned peoplesCount() {
    Stack picturesInRow = Stack(children: <Widget>[],);
    Positioned outputRow = Positioned(
        top: 180,
        right: 25,
        child: Container(
          height: 80,
          width: 100,
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        "",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
    double startRightPosition = 25; //25
    double topPosition = 100; //180
    if (peopleImages.length > 1) {
      for (int i = 0; i < peopleImages.length; i++) {
            picturesInRow.children.insert(i,
                Positioned(
                  top: topPosition,
                  right: startRightPosition -= 15 * i,
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                          peopleImages.elementAt(i),
                        ),
                      ),
                    ),
                  ),
                )
            );
      }
    }
    else{
      picturesInRow.children.insert(0,
          Positioned(
            top: topPosition,
            right: startRightPosition -= 15,
            child: Container(
              padding: EdgeInsets.all(3.0),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid
                ),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    peopleImages.elementAt(0),
                  ),
                ),
              ),
            ),
          )
      );
    }
    return outputRow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.45),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 8),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 25),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Container(
            width: 500,
            height: 255,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(backgroundImageName,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 35,
            child: Image.asset(seasonImage),
          ),
          Positioned(
            top: 145,
            left: 35,
            child:
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 40,
                  color: textColor,
                  fontFamily: 'Assistant',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            top: 195,
            left: 35,
            child:
            Text(
              seasonAndDuration,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Assistant'),
            ),
          ),
          Positioned(
            right: 15,
            top: 180,
            child: peoplesCount(),
          ),
          /*Positioned(
            top: 180,
            right: 25,
            child:
            Container(
              padding: EdgeInsets.all(3.0),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid
                ),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    peopleImageOne,
                  ),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
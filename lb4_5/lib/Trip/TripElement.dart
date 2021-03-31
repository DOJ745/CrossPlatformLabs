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

  Stack peoplesAccounts() {

    double startRightPosition = 15; //25
    Stack accountsInRow = Stack(children: <Widget>[]);

    Positioned accountStartPosition = Positioned(
      right: startRightPosition,
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
                peopleImages.elementAt(0),
              ),
            )
        ),
      ),
    );

    if (peopleImages.length > 1) {
      for (int i = 0; i < peopleImages.length; i++) {
        accountsInRow.children.insert(i,
                Positioned(
                  right: startRightPosition += 30 * i,
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
      accountsInRow.children.insert(0, accountStartPosition);
    }
    return accountsInRow;
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
            right: 0,
            top: 180,
            child: Container(
              width: 120,
              height: 70,
              //color: Colors.white,
              child: peoplesAccounts(),/*Stack(
                children: <Widget>[
                  Positioned(
                    right: 15,
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
                              "images/peoples/man2.jpg",
                            ),
                          )
                        ),
                      ),
                  ),
                  Positioned(
                    right: 45,
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
                              "images/peoples/man2.jpg",
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
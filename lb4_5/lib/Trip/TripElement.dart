import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Trip.dart';
import 'TripInfoSummary.dart';

class TripElement extends StatelessWidget {
  
  final Trip trip;
  final VoidCallback onTap;

  TripElement(
      {
        Key key,
        this.trip,
        this.onTap,
      } ) : super(key: key);

  Stack peoplesAccounts() {

    double startRightPosition = 15;
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
                trip.peopleImages.elementAt(0),
              ),
            )
        ),
      ),
    );

    if (trip.peopleImages.length > 1) {
      for (int i = 0; i < trip.peopleImages.length; i++) {
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
                         trip.peopleImages.elementAt(i),
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
    return FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TripInfoSummary(
                          trip: trip,
                      ),
              ),
          );
        },
        child:
        Container(
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
                  child: Image.asset(trip.backgroundImageName,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 55,
                left: 35,
                child: Image.asset(trip.seasonImage),
              ),
              Positioned(
                top: 145,
                left: 35,
                child:
                Text(
                  trip.name,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 40,
                      color: trip.textColor,
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
                  trip.seasonAndDuration,
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
                  child: peoplesAccounts(),
                ),
              ),
            ],
          ),
        )
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb9/BLoC/BlocProvider.dart';
import 'package:lb9/BLoC/Events/OpenTripElemenEvent.dart';
import 'package:lb9/BLoC/TripBloc.dart';
import 'package:lb9/Trip/Card/TripInfoSummary.dart';

import '../Trip.dart';

class TripElementNew extends StatefulWidget {
  @override
  _TripElementNewState createState() => _TripElementNewState();
}

class _TripElementNewState extends State<TripElementNew> {

  Stack peoplesAccounts(Trip trip) {

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

    final TripBloc bloc = BlocProvider.of(context);


    return StreamBuilder(
      stream: bloc.outTripElem,
      initialData: Trip.createDefaultCollection().elementAt(0),
      builder: (BuildContext context, AsyncSnapshot<Trip> snapshot) {
        return FlatButton(
            onPressed: () {
              bloc.counterEventSink.add(OpenTripElementCardEvent());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TripInfoSummary(
                        trip: snapshot.data,
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
                      child: Image.asset(snapshot.data.backgroundImageName,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 35,
                    child: Image.asset(snapshot.data.seasonImage),
                  ),
                  Positioned(
                    top: 145,
                    left: 35,
                    child:
                    Text(
                      snapshot.data.name,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 40,
                          color: snapshot.data.textColor,
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
                      snapshot.data.seasonAndDuration,
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
                      child: peoplesAccounts(snapshot.data),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}
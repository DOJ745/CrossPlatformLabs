import 'dart:async';

import '../Trip/Trip.dart';
import 'Events/OpenTripElemenEvent.dart';
import 'Events/TripEvent.dart';

class TripBloc {

  Trip _trip = new Trip();

  final _tripStateController = StreamController<Trip>();

  StreamSink<Trip> get _inTripElem => _tripStateController.sink;
  Stream<Trip> get tripElem => _tripStateController.stream;

  final _tripEventController = StreamController<TripEvent>();

  Sink<TripEvent> get counterEventSink => _tripEventController.sink;

  TripBloc() { _tripEventController.stream.listen(_eventToState); }

  void _eventToState(TripEvent event) {

    if (event is OpenTripElementCardEvent) {
      _trip = Trip.createDefaultCollection().elementAt(0);
    } /*else if (event is DecrementEvent) {
      _counter--;
    }*/ else {
      throw Exception('wrong Event type');
    }
    _inTripElem.add(_trip);
  }

  void dispose() {
    _tripStateController.close();
    _tripEventController.close();
  }
}
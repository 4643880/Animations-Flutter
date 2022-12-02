import 'package:animations_flutter_snt/models/Trip.dart';
import 'package:animations_flutter_snt/screens/details.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Trip> _tripList = [];

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(
        title: 'Beach Paradise',
        price: '350',
        nights: '3',
        img: 'beach.png',
      ),
      Trip(
        title: 'City Break',
        price: '400',
        nights: '5',
        img: 'city.png',
      ),
      Trip(
        title: 'Ski Adventure',
        price: '750',
        nights: '2',
        img: 'ski.png',
      ),
      Trip(
        title: 'Space Blast',
        price: '600',
        nights: '4',
        img: 'space.png',
      ),
    ];

    _trips.forEach((Trip trip) {
      _tripList.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tripList.length,
      itemBuilder: (context, index) {
        final item = _tripList[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  trip: item,
                ),
              ),
            );
          },
          contentPadding: const EdgeInsets.all(25),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${item.nights} nights',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300])),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/${item.img}',
              height: 50.0,
            ),
          ),
          trailing: Text('\$${item.price}'),
        );
      },
    );
  }
}

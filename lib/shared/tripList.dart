import 'package:animations_flutter_snt/models/Trip.dart';
import 'package:animations_flutter_snt/screens/details.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<Trip> _tripList = [];

  @override
  void initState() {
    super.initState();
    // It means this method should run after built method
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addTrips();
    });
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
      // index no e.g total items in list are 10 then index will be 9 means -1
      listKey.currentState?.insertItem(
        _tripList.length - 1,
        duration: const Duration(seconds: 1),
      );
    });
  }

  final Tween<Offset> _offset = Tween<Offset>(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: _tripList.length,
      itemBuilder: (context, index, animation) {
        final item = _tripList[index];
        return SlideTransition(
          position: animation.drive(_offset),
          child: ListTile(
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
              child: Hero(
                tag: "location-image-${item.img}",
                child: Image.asset(
                  'assets/images/${item.img}',
                  height: 50.0,
                ),
              ),
            ),
            trailing: Text('\$${item.price}'),
          ),
        );
      },
    );
  }
}

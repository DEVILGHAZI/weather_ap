import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ap/helper/color.dart';
import 'package:weather_ap/homepage/bloc/cubit.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/homepage.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';

class CustomDropdownButton extends StatefulWidget {
  final LocationModel location;

  CustomDropdownButton({required this.location});

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedItem;
  late WeatherCubit _cubit;
  

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<WeatherCubit>(context);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          height: 30,
          child: DropdownButton<String>(
            iconSize: 10,
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: 'Time',
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Time: ${widget.location.localtime.substring(10)}',
                        style: TextStyle(color: myGrey, fontSize: 15)),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Date',
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: myGrey, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Date: ${widget.location.localtime.substring(0, 10)}',
                        style: TextStyle(color: myGrey, fontSize: 15)),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: 'City',
                child: Row(
                  children: [
                    Icon(Icons.location_city, color: myGrey, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text('City: ${widget.location.name}',
                        style: TextStyle(color: myGrey, fontSize: 15)),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Region',
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: myGrey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Region: ${widget.location.region}',
                        style: TextStyle(color: myGrey, fontSize: 15)),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Country',
                child: Row(
                  children: [
                    Icon(Icons.public, color: myGrey, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Country: ${widget.location.country}',
                        style: TextStyle(color: myGrey, fontSize: 15)),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                onTap: _refreshData,
                value: 'Refresh',
                child: Row(
                  children: [
                    Icon(Icons.refresh, color: myGrey, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Refresh',
                        style: TextStyle(color: myGrey, fontSize: 15)),
                  ],
                ),
              ),
            ],
            onChanged: (String? newValue) {
             
            },
            dropdownColor: Colors.transparent,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 25,
            ),
            underline: Material(
              color: Colors.transparent,
              elevation: 0,
              child: Text(
                'Last Update on ${widget.location.localtime.length > 16 ? widget.location.localtime.substring(10, 16) : widget.location.localtime.substring(10)}',
                style: TextStyle(
                    color: const Color.fromARGB(140, 255, 255, 255),
                    fontSize: 12),
              ),
            ),
            isExpanded: true,
          ),
        ),
      ],
    );
  }
  late Future<LocationDetails> _locationDetails;
  void _refreshData() {
     _locationDetails = LocationService().getCurrentLocation();
  _locationDetails.then((location) {
      _cubit.fetchBothData(location.latitude, location.longitude);
    });
}
}
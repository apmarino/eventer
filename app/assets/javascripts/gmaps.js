// // handler = Gmaps.build('Google');
// // handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
// //   markers = handler.addMarkers([
// //     {
// //       "lat": 5,
// //       "lng": 5,
// //       "picture": {
// //         "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
// //         "width":  36,
// //         "height": 36
// //       },
// //       "infowindow": "hello!"
// //     }
// //   ]);
// //   handler.bounds.extendWith(markers);
// //   handler.fitMapToBounds();
// // });

// var handler = Gmaps.build('Google');
// handler.buildMap({ internal: {id: 'geolocation'} }, function(){
//   if(navigator.geolocation)
//     navigator.geolocation.getCurrentPosition(displayOnMap);
// });

// position.coords.latitute = 5;
// position.coords.longitude = -5;

// function displayOnMap(position){
//   var marker = handler.addMarker({
//     lat: position.coords.latitude,
//     lng: position.coords.longitude
//   });
//   handler.map.centerOn(marker);
// };
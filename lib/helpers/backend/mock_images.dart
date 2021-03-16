List<MockPhotos> mockPhotos = [
  MockPhotos(
    photos: 'images/p1.jpg',
    location: 'L',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p2.jpg',
    location: 'Anime',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p3.jpg',
    location: 'DC',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p4.jpg',
    location: 'A',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p5.jpg',
    location: 'Aporkilips',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p6.jpg',
    location: 'AD',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p7.jpeg',
    location: 'Krypton',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p8.png',
    location: 'Void',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p9.png',
    location: 'L',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
  MockPhotos(
    photos: 'images/p10.jpeg',
    location: 'A',
    coords: MockLatLng(lat: 12.0, lng: 3.0),
  ),
];

class MockPhotos {
  final String photos;
  final String location;
  final MockLatLng coords;

  MockPhotos({this.photos, this.location, this.coords});
}

class MockLatLng {
  final double lat;
  final double lng;

  MockLatLng({this.lat, this.lng});
}

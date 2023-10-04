class car_details_model {
  String? status;
  String? message;
  List<CarData>? carData;

  car_details_model({this.status, this.message, this.carData});

  car_details_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['car_data'] != null) {
      carData = <CarData>[];
      json['car_data'].forEach((v) {
        carData!.add(CarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (carData != null) {
      data['car_data'] = carData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarData {
  String? name;
  String? image;
  String? price;
  String? carModal;
  String? fuelType;
  String? licensePlateNumber;
  String? numberOfSeats;
  String? ownerId;

  CarData(
      {this.name,
        this.image,
        this.price,
        this.carModal,
        this.fuelType,
        this.licensePlateNumber,
        this.numberOfSeats,
        this.ownerId});

  CarData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    carModal = json['car_modal'];
    fuelType = json['fuel_type'];
    licensePlateNumber = json['license_plate_number'];
    numberOfSeats = json['number_of_seats'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['car_modal'] = carModal;
    data['fuel_type'] = fuelType;
    data['license_plate_number'] = licensePlateNumber;
    data['number_of_seats'] = numberOfSeats;
    data['owner_id'] = ownerId;
    return data;
  }
}
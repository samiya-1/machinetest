
class Data {
  int? id;
  String? medicineName;
  String? medicineQnty;
  String? medicineDescription;
  String? medicineDosage;
  String? medicineUsage;
  String? medicinePrice;
  String? medicinePhoto;
  String? medicineStatus;

  Data(
      {this.id,
        this.medicineName,
        this.medicineQnty,
        this.medicineDescription,
        this.medicineDosage,
        this.medicineUsage,
        this.medicinePrice,
        this.medicinePhoto,
        this.medicineStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicineName = json['medicine_name'];
    medicineQnty = json['medicine_qnty'];
    medicineDescription = json['medicine_description'];
    medicineDosage = json['medicine_dosage'];
    medicineUsage = json['medicine_usage'];
    medicinePrice = json['medicine_price'];
    medicinePhoto = json['medicine_photo'];
    medicineStatus = json['medicine_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicine_name'] = this.medicineName;
    data['medicine_qnty'] = this.medicineQnty;
    data['medicine_description'] = this.medicineDescription;
    data['medicine_dosage'] = this.medicineDosage;
    data['medicine_usage'] = this.medicineUsage;
    data['medicine_price'] = this.medicinePrice;
    data['medicine_photo'] = this.medicinePhoto;
    data['medicine_status'] = this.medicineStatus;
    return data;
  }
}
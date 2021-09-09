import 'package:speedoran/src/models/personalbestmodel.dart';

class PersonalBestListModel
{
  PersonalBestListModel({
    this.data
  });

  List<PersonalBestModel> data;    

  factory PersonalBestListModel.fromMap(Map<String,dynamic> json)=>
  PersonalBestListModel(
    data : json["data"] == null ? null : List<PersonalBestModel>.from(json["data"].map((x)=> PersonalBestModel.fromMap(x)))
  );
}
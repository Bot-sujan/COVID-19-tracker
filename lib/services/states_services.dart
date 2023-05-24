import 'dart:convert';

import 'package:covid_tracker/model/world_states_model.dart';
import 'package:covid_tracker/services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {

  Future<WorldStatesModel> fetchWorldStatesRecords () async {
      final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
       var data = jsonDecode(response.body);

      if(response.statusCode == 200) {
  
          return WorldStatesModel.fromJson(data);
      } else {
         throw Exception('Error');
      }
  }
   

    Future<List<dynamic>> countriesListApi () async {
      final response = await http.get(Uri.parse(AppUrl.countriesList));
       var data = jsonDecode(response.body);

      if(response.statusCode == 200) {
  
          return data;
      } else {
         throw Exception('Error');
      }
  }
}
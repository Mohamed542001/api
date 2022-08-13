import 'package:api/blocks/homeCubit/states.dart';
import 'package:api/screens/Business/BusinessImports.dart';
import 'package:api/screens/Science/ScienceImports.dart';
import 'package:api/screens/Setting/SettingImports.dart';
import 'package:api/screens/Sports/SportsImports.dart';
import 'package:api/utilities/dio_helper/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<BottomNavigationBarItem> bottomItems= const[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.spoke),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),

  ];

  List screens = [
    const Business(),
    const Sports(),
    const ScienceScreen(),
    const SettingScreen(),

  ];

  void changeBottomNavBar(i){
    currentIndex = i;
    if(i==1) {
      getSports();
    }else if(i==2){
      getSciences();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetBusinessLoadingState());

    if(sports.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }

  }

  List<dynamic> sciences = [];

  void getSciences() {
    emit(NewsGetScienceLoadingState());

    if(sciences.length==0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'Science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }


  }

}
import 'package:flutter/material.dart';

Color primary = Color.fromARGB(255, 13, 24, 110);

var Login_api =
    "https://raw.githubusercontent.com/ramkrish24/site_construction/json/login.json";

var orderAPI =
    "https://raw.githubusercontent.com/ramkrish24/site_construction/json/order_details.json";

colors(String value) {
  if (value.toUpperCase() == "APPROVED" ||
      value.toLowerCase() == "accepted" ||
      value.toLowerCase() == "dispatched" ||
      value.toLowerCase() == "returned") {
    return Colors.green;
  } else if (value.toLowerCase() == "pending") {
    return Color.fromARGB(255, 162, 146, 0);
  }
}

String Date(String date) {
  String str = "";
  String optimized = date.toString().substring(0, 10);
  String month = optimized.substring(5, 7);
  String month_words = "";
  String date_number = optimized.substring(8, 10);
  switch (month) {
    case "01":
      {
        month_words = "Jan";
      }
      break;
    case "02":
      {
        month_words = "Feb";
      }
      break;
    case "03":
      {
        month_words = "Mar";
      }
      break;
    case "04":
      {
        month_words = "Apr";
      }
      break;
    case "05":
      {
        month_words = "May";
      }
      break;
    case "06":
      {
        month_words = "Jun";
      }
      break;
    case "07":
      {
        month_words = "July";
      }
      break;
    case "08":
      {
        month_words = "Aug";
      }
      break;
    case "09":
      {
        month_words = "Sep";
      }
      break;
    case "10":
      {
        month_words = "Oct";
      }
      break;
    case "11":
      {
        month_words = "Nov";
      }
      break;
    case "12":
      {
        month_words = "Dec";
      }
  }
  return month_words + " " + date_number;
}

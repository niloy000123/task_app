// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF1E9EFD);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryOrange = Color(0xFFFF9169);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color.fromARGB(255, 92, 92, 92);

//test size
const FONT_XL = 22.0;
const FONT_L = 18.0;
const FONT_M = 14.0;
const FONT_S = 12.0;
const FONT_XS = 10.0;

const PADING_2XL_SIZE = 20.0;
const PADING_L_SIZE = 15.0;
const PADING_M_SIZE = 10.0;
const PADING_S_SIZE = 8.0;

//error code
const INVALID_RESPONSE = 100;
const NO_INTERNATE = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
const HTTP_ERROR = 104;
const TIME_OUT_ERROR = 105;

//error message
const INVALID_RESPONSE_MSG = 'Request invalid response.';
const HTTP_ERROR_MSG = 'HTTP Error Occurred.';
const INVALID_FORMAT_MSG = 'Invalid format error.';
const UNKNOWN_ERROR_MSG = 'Unknown error has been occurred.';
const NO_INTERNATE_MSG =
    'No Internet connection. Please check your connection.';
const TIME_OUT_ERROR_MSG = 'Request time out.. Pleae try again.';

//request url
const BASE_URL = 'https://fakestoreapi.com/';
const GET_PRODUCTS =
    "https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test/";

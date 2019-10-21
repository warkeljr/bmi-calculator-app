import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/models/size_config.dart';


// Font sizes
// Font sizes are configured by the size_config model
const kFontSizeXXS = 12.0;
const kFontSizeXS = 16.0;
// Size 20 -> size_config 2.2
const kFontSizeM = 20.0;
const kFontSizeML = 30.0;
const kFontSizeL = 50.0;
const kFontSizeXL = 70.0;
const kFontSizeXXL = 90.0;


// Label text style
const kLabelTextStyleXXS = TextStyle(
  fontSize: kFontSizeXXS,
  color: kLightGreyColor,
);


const kLabelTextStyleXS = TextStyle(
  fontSize: kFontSizeXS,
  color: kLightGreyColor,
);

const kLabelTextStyleM = TextStyle(
  fontSize: kFontSizeM,
  color: kWhiteColor,
  fontWeight: FontWeight.w900,
);
// CUSTOM FONT FAMILY-----------------------------
const kLabelTextStyleL = TextStyle(
  fontSize: kFontSizeL,
  color: kWhiteColor,
  fontWeight: FontWeight.w700,
  fontFamily: 'Rubik',
);
//--------------------------------------------------

const kLabelTextStyleXL = TextStyle(
  fontSize: kFontSizeXL,
  color: kLightGreyColor,
);

const kResultTextStyleGreen = TextStyle(
  fontSize: kFontSizeM,
  color: kBmiGreenColor,
  fontWeight: FontWeight.bold,
);

const kResultTextStyleBigNumber = TextStyle(
  fontSize: kFontSizeXL,
  color: kWhiteColor,
  fontWeight: FontWeight.w900,
);


// Icon sizes
const kIconSize = 80.0;


// Icon colors



// Colors
const kPrimaryColor = Color(0xFF0A0E21);
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kPinkColor = Color(0xFFEB1555);
const kWhiteColor = Color(0xFFFAFAFA);
const kLightGreyColor = Color(0xFF8D8E98);
const kGreyColor =  Color(0xFF4C4F5E);
const kPinkOverlayColor = Color(0x1FEB1555);
const kSoftRedColor = Color(0xFFff1744);
const kSoftGreenColor = Color(0xFF1de9b6);
const kSoftAmberColor = Color(0xFFffc400);


// BMI indication colors
const kBmiBlueDark = Color(0xFF007ECB);
const kBmiBlueMiddle = Color(0xFF00B0FF);
const kBmiBlueLight = Color(0xFF80D8FF);
const kBmiGreenColor = Color(0xFF24D678);
const kBmiYellow = Color(0xFFFFC400);
const kBmiOrangeLight = Color(0xFFFF9100);
const kBmiOrangeDark = Color(0xFFFF6D00);
const kBmiRed = Color(0xFFDD2C00);




// SizedBox
const kSizeBoxedHeightXS = 5.0;
const kSizeBoxedWidthXS = 5.0;
const kSizeBoxedHeightS = 10.0;
const kSizeBoxedWidthS = 10.0;
const kSizeBoxedHeightM = 15.0;
const kSizeBoxedWidthM = 15.0;
const kSizeBoxedHeightL = 20.0;
const kSizeBoxedWidthL = 20.0;
const kSizeBoxedHeightXL = 25.0;
const kSizeBoxedWidthXL = 25.0;
const kSizeBoxedHeightXXL = 30.0;
const kSizeBoxedWidthXXL = 30.0;

// Container
const kBottomContainerHeight = 80.0;

BoxDecoration kMyBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      //width: 5.0,
      color: kWhiteColor,
    ),
    shape: BoxShape.circle,
  );
}
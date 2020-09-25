

import 'package:flutter/cupertino.dart';

class SizeConfig{

  SizeConfig();

  double _blockSizeVertical;
  double _blockSizeHorisotal;
  static double titleSize,imageSize,heightMulti,widhtMulti;
  
 void init(BoxConstraints constraints){
     _blockSizeHorisotal=constraints.maxWidth/100;
     _blockSizeVertical=constraints.maxHeight/100;
     titleSize=_blockSizeVertical;
     imageSize=_blockSizeHorisotal;
     heightMulti=_blockSizeVertical;
     widhtMulti=_blockSizeHorisotal;
     print('hori : $_blockSizeHorisotal');
     print('vir: $_blockSizeVertical');
  }
  
}
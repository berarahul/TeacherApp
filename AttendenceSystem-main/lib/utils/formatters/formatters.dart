import 'package:intl/intl.dart';

class RFormatter{

static String formatDate(DateTime? date) {
  date ?? DateTime.now();
  return DateFormat('dd-MMM-yyyy').format(
      date!); // Customize the date format as needed
}
static String formatCurrency(double amount){
  return NumberFormat.currency(locale: 'en_us',symbol: '\$').format(amount);
}
static String formatphonenumber(String phonenumber){
  if(phonenumber.length==10){
    return '(${phonenumber.substring(0,3)})  ${phonenumber.substring(3,6)} ${phonenumber.substring(6)} ';
  }else if(phonenumber.length==11){
    return '(${phonenumber.substring(0,4)})  ${phonenumber.substring(4,7)} ${phonenumber.substring(7)} ';
  }
  return phonenumber;
}
// Not fully tested
static String ?internationalFormatPhoneNumber(String phonenumber){
  var digitsOnly =phonenumber.replaceAll(RegExp(r'\d'),'');

  // Extract the country code from the digitsOnly
  String CountryCode ='+${digitsOnly.substring(0,2)}';
  digitsOnly = digitsOnly.substring(2);

  // Add the remaining digits with proper formating
   final formatedNumber =StringBuffer();
   formatedNumber.write('($CountryCode )');

   int i=0;
   while(i<digitsOnly.length){
     int groupLength=2;
     if(i==0 && CountryCode=='+1'){
       groupLength=3;
     }
     int end=i+groupLength;
     formatedNumber.write(digitsOnly.substring(i,end));
     if(end<digitsOnly.length){
       formatedNumber.write(' ');
     }
     i=end;
   }
   return null;

}
}


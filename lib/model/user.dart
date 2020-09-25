class User{

 String _email,_password,_token;

 User(email,password,[this._token]){
   _password=password;
   _email=email;
 }
  set token (token){
   this._token=token;
 } 
 String get password => _password;
 String get email => _email;
 String get token => _token;

}
class AuthQuery {
  static String createUser =r'''
mutation createUser($username : String! , $email:String! , $password : String!){
 register(input :{username :$username , email  :$email , password :$password}){
    jwt,
    user{
      id,username,email
    }
  }
}
 ''';

  static String login = """
mutation signIn(\$password : String! , \$identifier : String!){
  login(input :{password :\$password , identifier :\$identifier}){
    jwt,user{
      username,email
    }
  }
}
  """;
}

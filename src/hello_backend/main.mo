import Error "mo:base/Error";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";

actor {

  stable var state = 0;
  type Details ={
    firstname : Text;
    lastname : Text;
    email : Text;
    phone : Nat;
    message : Text;
  };
  var map = HashMap.HashMap<Text,Details>(0,Text.equal,Text.hash);
  public func insert(customerName : Text,info: Details) : async Text {
    let details: Details={
      firstname = info.firstname;
      lastname = info.lastname;
      email = info.email;
      phone = info.phone;
      message = info.message;
    };
    map.put(customerName,details);
    return "Data Inserted Successfully"
  };
  public func fetchData(customerName:Text) :async Details {
    let data: Details = switch(map.get(customerName)){
      case(?value){value};
      case(null) {throw Error.reject("Key does not exist")};
    };
    return data;
  }
};

class Payment{

  final String name;
  final String image;
  final String amount;

  Payment({this.name,this.amount,this.image});

  static List<Payment> allCities()
  {
    var lstOfCities = new List<Payment>();

    lstOfCities.add(new Payment(name:"Electricity",amount: "260 L.E",image: "Electriction.png"));
    lstOfCities.add(new Payment(name:"Water",amount: "320 L.E",image: "water.png"));
    lstOfCities.add(new Payment(name:"Gas", amount: "460 L.E",image: "gas.png"));
    lstOfCities.add(new Payment(name:"Leadline", amount: "160 L.E",image: "leadline.png"));
    lstOfCities.add(new Payment(name:"Internet",amount: "340 L.E",image: "internet.png"));
    lstOfCities.add(new Payment(name:"cleanliness",amount: "190 L.E",image: "cleanliness.png"));
    lstOfCities.add(new Payment(name:"Braber",amount: "50 L.E",image: "braber.png"));
    return lstOfCities;
  }

}
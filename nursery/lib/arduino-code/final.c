
//This example shows how to set stream event callback functions.
//Two events are available from Firebase's Real Time database HTTP stream connection, dataAvailable and streamTimeout.

//Required HTTPClientESP32Ex library to be installed  https://github.com/mobizt/HTTPClientESP32Ex


#include <WiFi.h>
#include "FirebaseESP32.h"
#include "DHT.h"

#define FIREBASE_HOST "https://naraa-4453.firebaseio.com" //Do not include https:// in FIREBASE_HOST

#define FIREBASE_AUTH "AIzaSyChxt_83nWvRgmEHKac0mIyMdefuDNQLYw"   <----- FIREBASE_AUTH
#define WIFI_SSID "wifi"
#define WIFI_PASSWORD "12345678"
String generalPath="/Garbeg";
String json = "";
String path = "/Sensors";
//omar
const int ledPin = 32;
int buz=13;
const int soundPin = 35;
int threshold = 300;

//heart
int PulseSensorPurplePin = 4;        

int LED21 = 21;   

int Signal;                
int Thresholdh = 3450;         

//******Humiday and temprature sensor*******


#define DHTTYPE DHT11   // DHT 11
// DHT Sensor
const int DHTPin = 15;
// Initialize DHT sensor.
DHT dht(DHTPin, DHTTYPE);

// Temporary variables for temperature sensor
static char celsiusTemp[7];
static char fahrenheitTemp[7];
static char humidityTemp[7];

//**************PIR motion *****************
//PIR motion
int ledPinPir = 26;
int pirPin = 27;
int val = 0;

//*********************Define Firebase Data objects ***********&**********************
FirebaseData firebaseData1;

unsigned long sendDataPrevMillis1;


uint16_t count1;

void streamCallback1(StreamData data)
{

  Serial.println("> Stream Data1 available...");
  Serial.println("> STREAM PATH: " + data.streamPath());
  Serial.println("> PATH: " + data.dataPath());
  Serial.println("> TYPE: " + data.dataType());
  Serial.print("> VALUE: ");
  if (data.dataType() == "int")
    Serial.println(data.intData());
  else if (data.dataType() == "float")
    Serial.println(data.floatData());
  else if (data.dataType() == "string")
    Serial.println(data.stringData());
  else if (data.dataType() == "json")
    Serial.println(data.jsonData());
  Serial.println();
}

void streamTimeoutCallback1()
{
  Serial.println();
  Serial.println("> Stream 1 timeout, resume streaming...");
  Serial.println();
}
//****************************************************************


void setup()
{

  Serial.begin(115200);
  Serial.println();
  Serial.println();
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
//**********************
 //Omar

   pinMode(21,OUTPUT); 
  pinMode(ledPin,OUTPUT);
  pinMode(13,OUTPUT);

  //********************************
  //Humiday and temprature sensor >>> initialize the DHT sensor
  dht.begin();

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  

  Serial.println("------------------------------------");
  Serial.println("> Begin stream 1...");

  if (!Firebase.beginStream(firebaseData1, path))
  {
    Serial.println("> FAILED");
    Serial.println("> REASON: " + firebaseData1.errorReason());
    Serial.println();
  }
  else
  {
    Serial.println("> PASSED");
    Serial.println("------------------------------------");
    Serial.println();
  }

  Firebase.setStreamCallback(firebaseData1, streamCallback1, streamTimeoutCallback1);

  //PIR motion
  pinMode (ledPin,OUTPUT);
  pinMode (pirPin, INPUT);
}

void calcTempraturAndHumidity(){
            //read humidity
            float h = dht.readHumidity();
            // Read temperature as Celsius (the default)
            float t = dht.readTemperature();
            // Read temperature as Fahrenheit (isFahrenheit = true)
            float f = dht.readTemperature(true);
            // Check if any reads failed and exit early (to try again).
            if (isnan(h) || isnan(t) || isnan(f)) {
              Serial.println("Failed to read from DHT sensor!");
              strcpy(celsiusTemp,"Failed");
              strcpy(fahrenheitTemp, "Failed");
              strcpy(humidityTemp, "Failed");         
            }
            else{
              // Computes temperature values in Celsius + Fahrenheit and Humidity
              float hic = dht.computeHeatIndex(t, h, false);
              /*dtostrf(FLOAT,WIDTH,PRECSISION,BUFFER);>> convert a double (or float) to a string 
              FLOAT in my case would be temperature
              WIDTH is the number of characters to use in the output
              PRECISION is the number of characters after the decimal point
              BUFFER is where the write the characters to
              */      
              dtostrf(hic, 6, 2, celsiusTemp);             
              float hif = dht.computeHeatIndex(f, h);
              dtostrf(hif, 6, 2, fahrenheitTemp);         
              dtostrf(h, 6, 2, humidityTemp);
              
              // You can delete the following Serial.print's, it's just for debugging purposes
              Serial.print("Humidity: ");
              Serial.print(h);
              Serial.println();
              Serial.print("Temperature: ");
              Serial.print(t);
              Serial.print(" *C ");
              Serial.print(f);
              Serial.print(" *F");
              Serial.println();
            
             } 
             
          
  }
//update data on the server
void updateNode(String PathStr,String JsonStr){
  
    
    //JSON is derived from JavaScript object notation
    Serial.println("------------------------------------");
    Serial.println("> Update Data 1...");
    if (Firebase.updateNode(firebaseData1, PathStr, JsonStr))
    {
      Serial.println("> PASSED");
      Serial.println("> PATH: " + firebaseData1.dataPath());
      Serial.println("> TYPE: " + firebaseData1.dataType());
      Serial.print("> VALUE: ");
      if (firebaseData1.dataType() == "int")
        Serial.println(firebaseData1.intData());
      else if (firebaseData1.dataType() == "float")
        Serial.println(firebaseData1.floatData());
      else if (firebaseData1.dataType() == "string")
        Serial.println(firebaseData1.stringData());
      else if (firebaseData1.dataType() == "json")
        Serial.println(firebaseData1.jsonData());
      Serial.println("------------------------------------");
      Serial.println();
    }
    else
    {
      Serial.println("> FAILED");
      Serial.println("> REASON: " + firebaseData1.errorReason());
      Serial.println("------------------------------------");
      Serial.println();
    }
  }

  //Omar
  void smok() 
{
  float sensorVoltage; 
  float sensorValue;
   sensorValue = analogRead(34);
  sensorVoltage = sensorValue/1024*5.0;
   Serial.print("sensor voltage = ");
  Serial.print(sensorVoltage);
  Serial.println(" V");
  if(sensorVoltage > 5.0){
    digitalWrite(buz,HIGH);
    //store it in emergency status node
    json = "{ \"Status\"  : \"Gas detected\"}";
    updateNode(generalPath,json);

  }else{
    digitalWrite(buz,LOW);
    
  }
  delay(1000);
}

void sound()
{ int value = analogRead(soundPin);
Serial.println(value);
if(value > threshold)
{
  digitalWrite(ledPin,HIGH);
  generalPath=path + "/Sound"+"/";
    json = "{ \"Status\"  :  \"Sound detected\"}";
    updateNode(generalPath,json);
  delay(200);
  }
  else { digitalWrite(ledPin,LOW);
    generalPath=path + "/Sound"+"/";
    json = "{ \"Status\"  :  \"No Sound detected\"}";
    
    updateNode(generalPath,json);
  }
  delay(1000);
  } 


void heart() {
//Serial.begin(9600);
Signal = analogRead(PulseSensorPurplePin);  

Serial.println(Signal);                    

if(Signal > Thresholdh){                          

digitalWrite(21,HIGH);

}else if (Signal=0)
{
  json = "{ \"Status\"  : \"No heart signal detected\"}";
    updateNode(generalPath,json);
} else {

digitalWrite(21,LOW);
}

delay(10);

}




  void loop(){
if(millis() - sendDataPrevMillis1 > 10000){
      sendDataPrevMillis1 = millis();
      //Temperature and humidity sensor
    calcTempraturAndHumidity();
    //Check temperature Danger
  if(atoi(celsiusTemp)>=37){
           json = "{ \"Status\"  :  \"High temperature\"}"; 
           updateNode(generalPath,json);
          }
            else if(atoi(celsiusTemp)>40){
            json = "{ \"Status\"  :  \"Very high temperature\"}"; 
            updateNode(generalPath,json);
          }else{
    generalPath=path + "/TemperatureHumidity"+"/Temperature"+"/";
    json = "{ \"Celsius\"  :  " + String(celsiusTemp) + "}";
    updateNode(generalPath,json);
    delay(1000);
    generalPath=path + "/TemperatureHumidity"+"/Temperature"+"/";
    json = "{ \"Fahrenheit\"  :  " + String(fahrenheitTemp) + "}";
    updateNode(generalPath,json);
    delay(1000);
    generalPath=path + "/TemperatureHumidity"+"/Humidity"+"/";
    json = "{ \"Humidity\"  :  " + String(humidityTemp) + "}";
    updateNode(generalPath,json);
    delay(1000);
          }
      }
      //PIR motion
  val = digitalRead(pirPin);
  digitalWrite(ledPinPir,val);
if (val == 1){
    generalPath=path + "/PIR_motion"+"/";
    json = "{ \"Status\"  :  " + String(val) + "}";
    updateNode(generalPath,json);
    digitalWrite(ledPinPir,LOW);
    delay(1000);
    val=0;
    generalPath=path + "/PIR_motion"+"/";
    json = "{ \"Status\"  :  " + String(val) + "}";
    updateNode(generalPath,json);
    delay(1000);
}
heart();
smok();
sound();

}

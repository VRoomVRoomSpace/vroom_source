// -----------------------------------
// Controlling LEDs over the Internet
// -----------------------------------

Servo myservo;
Servo myservo2;

int potpin = 0;
int potpin2 = 1;

int val = 94;
int val2 = 93;

// This routine runs only once upon reset
void setup()
{
   //Register our Spark function here
   Spark.function("car", move);

   // Configure the pins to be outputs
   //pinMode(led1, OUTPUT);
   //pinMode(led2, OUTPUT);

   // Initialize both the LEDs to be OFF
   //digitalWrite(led1, LOW);
   //digitalWrite(led2, LOW);

   myservo.attach(0);
   myservo2.attach(1);
}


// This routine loops forever
void loop()
{
   // Nothing to do here
}


// This function gets called whenever there is a matching API request
// the command string format is l<led number>,<state>
// for example: l1,HIGH or l1,LOW
//              l2,HIGH or l2,LOW

int move(String command)
{
   /*int state = 0;
   //find out the pin number and convert the ascii to integer
   int pinNumber = (command.charAt(1) - '0') - 1;
   //Sanity check to see if the pin numbers are within limits
   if (pinNumber < 0 || pinNumber > 1) return -1;

   // find out the state of the led
   if(command.substring(3,7) == "HIGH") state = 1;
   else if(command.substring(3,6) == "LOW") state = 0;
   else return -1;

   // write to the appropriate pin
   digitalWrite(pinNumber, state);
   */

   //stop
   if(command.charAt(0)=='s'){
      val = 94;
      val2 = 93;
   }
   // go
   else if(command.charAt(0)=='v'){
      val = 0;
      val2 = 179;
   }
   //left
   else if(command.charAt(0)=='r'){
      val=179;
      val2 = 93;
   }
   //right
   else if(command.charAt(0)=='l'){
      val=94;
      val2=0;
   }
   //reverse
   else if(command.charAt(0)=='g'){
      val=179;
      val2=0;
   }
   myservo.write(val);
   myservo2.write(val2);    
   return 1;
}

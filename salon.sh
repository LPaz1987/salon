#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

	echo -e "\n~~~~~ MY SALON ~~~~~\n"

	echo -e "Welcome to My Salon, how can I help you?\n"
MAIN_MENU() {

	if [[ $1 ]]
  	then
    	echo -e "\n$1"
  	fi

	
	echo -e "
1) cut
2) color
3) perm
4) style
5) trim	"
	read SERVICE_ID_SELECTED
	
	case $SERVICE_ID_SELECTED in
		1) CUT ;;
		2) COLOR ;;
		3) PERM ;;
		4) STYLE ;;
		5) TRIM ;;
		*) MAIN_MENU "I could not find that service. What would you like today?" ;;
	esac
}


CUT() {
	echo -e "\nWhat's your phone number?"
	read CUSTOMER_PHONE
	#CHECK PHONE NUMBER
	GET_PHONE_NUMBER=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
	if [[ -z $GET_PHONE_NUMBER ]]
	then
   		echo -e "\nI don't have a record for that phone number, what's your name?"
     	read CUSTOMER_NAME
		#INSERT NAME
		INSERT_CUSTOMER_INFO=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
		echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
		read SERVICE_TIME
		#INSERT APPOINTMENT
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

	else

		GET_CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		echo -e "\nWhat time would you like your cut,$GET_CUSTOMER_NAME?"
		read SERVICE_TIME
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a cut at $SERVICE_TIME,$GET_CUSTOMER_NAME."
	fi
}
COLOR() {
	echo "color"
	echo -e "\nWhat's your phone number?"
	read CUSTOMER_PHONE
	#CHECK PHONE NUMBER
	GET_PHONE_NUMBER=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
	if [[ -z $GET_PHONE_NUMBER ]]
	then
       		echo -e "\nI don't have a record for that phone number, what's your name?"
       
		read CUSTOMER_NAME
		#INSERT NAME
		INSERT_CUSTOMER_INFO=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
				echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
		read SERVICE_TIME
	#INSERT APPOINTMENT
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a color at $SERVICE_TIME,$CUSTOMER_NAME."
	else

		GET_CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		echo -e "\nWhat time would you like your color, $GET_CUSTOMER_NAME?"
		read SERVICE_TIME
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a color at $SERVICE_TIME, $GET_CUSTOMER_NAME."

	fi
}
PERM() {
	echo "perm"
	echo -e "\nWhat's your phone number?"
	read CUSTOMER_PHONE
	#CHECK PHONE NUMBER
	GET_PHONE_NUMBER=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
	if [[ -z $GET_PHONE_NUMBER ]]
	then
       		echo -e "\nI don't have a record for that phone number, what's your name?"

		read CUSTOMER_NAME
		#INSERT NAME
		INSERT_CUSTOMER_INFO=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
				echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
		read SERVICE_TIME
	#INSERT APPOINTMENT
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a perm at $SERVICE_TIME, $CUSTOMER_NAME."
	else

		GET_CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		echo -e "\nWhat time would you like your perm,$GET_CUSTOMER_NAME?"
		read SERVICE_TIME
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a perm at $SERVICE_TIME, $GET_CUSTOMER_NAME."
	fi
}
STYLE() {
echo "style"
	echo -e "\nWhat's your phone number?"
	read CUSTOMER_PHONE
	#CHECK PHONE NUMBER
	GET_PHONE_NUMBER=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
	if [[ -z $GET_PHONE_NUMBER ]]
	then
       
       		echo -e "\nI don't have a record for that phone number, what's your name?"
		read CUSTOMER_NAME
		#INSERT NAME
		INSERT_CUSTOMER_INFO=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
				echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
		read SERVICE_TIME
	#INSERT APPOINTMENT
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a style at $SERVICE_TIME, $CUSTOMER_NAME."
	else

		GET_CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		echo -e "\nWhat time would you like your style,$GET_CUSTOMER_NAME?"
		read SERVICE_TIME
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a style at $SERVICE_TIME, $GET_CUSTOMER_NAME."
	fi
}
TRIM() {
	echo -e "\nWhat's your phone number?"
	read CUSTOMER_PHONE
	#CHECK PHONE NUMBER
	GET_PHONE_NUMBER=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
	if [[ -z $GET_PHONE_NUMBER ]]
	then
       		echo -e "\nI don't have a record for that phone number, what's your name?"
		read CUSTOMER_NAME
		#INSERT NAME
		INSERT_CUSTOMER_INFO=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
				echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
		read SERVICE_TIME
	#INSERT APPOINTMENT
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
	else

		GET_CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
		GET_CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
		echo -e "\nWhat time would you like your trim,$GET_CUSTOMER_NAME?"
		read SERVICE_TIME
		INSERT_APP=$($PSQL "insert into appointments(time,customer_id,service_id) values('$SERVICE_TIME','$GET_CUSTOMER_ID',1)")
		echo -e "\nI have put you down for a trim at $SERVICE_TIME, $GET_CUSTOMER_NAME."
	fi
}


MAIN_MENU


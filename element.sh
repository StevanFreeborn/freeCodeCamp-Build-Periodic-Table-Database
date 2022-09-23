PSQL="psql --csv --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1;")
  PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number = $1;")

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    IFS=',' read ATOMIC_NUMBER SYMBOL NAME <<< $ELEMENT
  fi
  
fi
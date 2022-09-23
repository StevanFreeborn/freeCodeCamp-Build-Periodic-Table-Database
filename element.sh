PSQL="psql --csv --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = $1;")

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $1;")

    IFS=',' read ATOMIC_NUMBER SYMBOL NAME <<< $ELEMENT
    IFS=',' read ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< $PROPERTIES
  fi
  
fi
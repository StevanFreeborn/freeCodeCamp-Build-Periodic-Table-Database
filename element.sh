PSQL="psql --csv --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1;")
  echo $ELEMENT
fi
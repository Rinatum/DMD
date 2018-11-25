import main

# select = "CREATE PROCEDURE procedure1() BEGIN " \
#          "SET @p := 2; " \
#          "WHILE @p<20 " \
#          "DO SET @p:=@p+1;" \
#          "SELECT * FROM Location" \
#          "END WHILE; " \
#          "END;"

select = "DELIMITER // -- is imporant" \
         "CREATE PROCEDURE mypro ()" \
         "BEGIN" \
         "SET @counter = 1;" \
         "SET @result = "";" \
         "WHILE (@counter < 20) DO" \
         "SET @counter = @counter + 1;" \
         "SET @result = CONCAT(@result, ", ", @counter);" \
                                           "END WHILE;" \
                                           "SELECT @result;" \
                                           "END //"

print(main.call_procedure('examaple'))


#!/bin/bash

echo Hi user
echo what is your age?
read age

if [ $age -ge 18 ]
then
	echo You can vote !
else 
	echo Sorry You cannot vote !
fi	

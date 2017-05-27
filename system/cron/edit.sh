echo '====================================='
echo 'Sample cron entry'
echo '====================================='
echo '#min hour day month weekday command'
echo '*/1   *    *    *    *     <your command>'
echo '====================================='
echo 'Would you like to edit the cron file? (y/n)'
read edit
if [ "$edit" == 'y' ];
then
crontab -e
else
echo 'Exiting'
fi

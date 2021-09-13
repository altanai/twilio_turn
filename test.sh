pm2 describe twilio_turn > /dev/null
RUNNING=$?

if [ "${RUNNING}" -ne 0 ]; then
  echo " Not even ran "
else
  echo " Running of stopped"
fi;

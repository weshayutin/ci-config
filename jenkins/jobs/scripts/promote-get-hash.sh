export NEW_HASH=`curl $DELOREAN_URL | grep baseurl | awk -F '/' '{ print $5"/"$6"/"$7 }'`
export OLD_HASH=`curl $LAST_PROMOTED_URL | grep baseurl | awk -F '/' '{ print $5"/"$6"/"$7 }'`

# No need to run the whole promote pipeline if there is nothing new to promote
if [ $OLD_HASH == $NEW_HASH ]; then
    exit 23
fi

echo "delorean_current_hash = $NEW_HASH" > $HASH_FILE
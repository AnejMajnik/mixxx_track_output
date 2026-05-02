#!/usr/bin/env bash
TXTFILE=~/mixxx_track_output.txt
DB=~/.mixxx/mixxxdb.sqlite
touch $TXTFILE
echo " " > $TXTFILE

while true; do
	if pgrep -x mixxx > /dev/null; then
		TRACK=$(sqlite3 $DB "select library.artist || ' - ' || library.title from library where library.id = (select PlaylistTracks.track_id from PlaylistTracks where id = (select max(id) from PlaylistTracks));")
		echo "$TRACK" > $TXTFILE
	else
		echo " " > $TXTFILE
	fi
	sleep 5
done

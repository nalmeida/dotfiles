#!/bin/bash



SOURCE_DIR="$@"
SORTED_DIR="$SOURCE_DIR"
MOVE_FILES=FALSE

echo "---------------------------"
echo "➔ Scanning folder $SOURCE_DIR"
echo ""

find "$SOURCE_DIR" -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.nef" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.mpg" -o -iname "*.mp4" > images.tmp

cat ./images.tmp | while read file;
do
	# Get the creation date of the item and store it in a variable
	file_date=`stat -f '%Sm' -t "%F" "$file"`;

	# Does a folder with this date already exist?
	if [ ! -d "$SORTED_DIR/$file_date" ]; then
		# If no, create the folder
		mkdir -p $SORTED_DIR/$file_date
	fi

	echo "---------------------------"

	destination_folder="$SORTED_DIR/$file_date/"

	if [ "$MOVE_FILES" == "TRUE" ]; then
		action_type="Moving"
		# Moves the file to the folder
		mv "$file" "$destination_folder"
	else
		# Copies the file to the folder
		cp "$file" "$destination_folder"
		action_type="Copying"
	fi;

	echo "$action_type file $file to $SORTED_DIR/$file_date/"

done

rm ./images.tmp

echo ""
echo "✔ Done"
echo "---------------------------"
echo "Enter the path to the data folder:"
read path
target="/data/db"
if [ ! -d "$target" ]
then
	mkdir -p "$target"
fi
sudo ln -s "$path" "$target"
echo "done."

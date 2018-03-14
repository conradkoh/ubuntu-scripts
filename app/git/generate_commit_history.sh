BASEDIR=$PWD
RELEASE_LOG="$BASEDIR"/"releases.txt"
LOGDIR="$BASEDIR"/"LOGS"
PREFIX_RELEASE="remotes/origin/release/"
PREFIX_RELEASE_LENGTH=${#PREFIX_RELEASE}
FOLDERNAME="vital_portal"
NULL_IDENITIFIER='.null'

if [ ! -d $LOGDIR ]; then
	mkdir "$LOGDIR" #create the log directory if it does not exist
fi

echo "Prefix length: $PREFIX_RELEASE_LENGTH"
set +e
cd "$FOLDERNAME";

#Get all releases and log them to the release log
git branch -a --sort=committerdate | grep "remotes/origin/release/" > $RELEASE_LOG

#Input the release log file into the loop and process the releases
while IFS= read -r release
do
	# ---------------------------
	# variable processing 
	# ---------------------------
	# remove leading whitespace characters
	release="${release#"${release%%[![:space:]]*}"}"
	release="${release:PREFIX_RELEASE_LENGTH}" #remove the prefix from the variable
	outfile="$LOGDIR"/"LOG_f""${previous_release}""_t""${release}"".txt"
	# ---------------------------
	# process release versions
	# ---------------------------
	#check previous release variable
	if [ -z "$previous_release" ]; then
		git checkout -f "release"/"$release"
		git clean -fd
		git checkout .
	else
		echo "Change log FROM: ${previous_release} TO: ${release}" > "${outfile}"
		git checkout -f "release"/"$release"
		git clean -fd
		git checkout .
		#git log --left-right --graph --cherry-pick --oneline release/1.3.3.0..release/1.3.4.0 | grep ">" | grep -v Merge
		git log --cherry-pick --oneline "release/${previous_release}".."release/${release}" >> "${outfile}"
		
	fi
	
	previous_release=$release #set the variable for the previous release
	
	
done < "$RELEASE_LOG"
echo $origin
cd $BASEDIR;
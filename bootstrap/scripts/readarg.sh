MANUAL=0
while [ "$1" != "" ]; do
    case $1 in
        -m | --manual )          
	        MANUAL=1
	        ;;
    esac
    shift
done
export MANUAL
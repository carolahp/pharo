#For manual bootstrapping
MANUAL=0
while [ "$1" != "" ]; do
    echo "in while"
        
    case $1 in
        -m | --manual )
          MANUAL=1
          ;;
    esac
    shift
done
export MANUAL
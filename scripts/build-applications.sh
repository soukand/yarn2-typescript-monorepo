DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

APPLICATIONS_DIR=$DIR/../applications

yarn
yarn install

cd $APPLICATIONS_DIR

APPLICATIONS=( $(find . -maxdepth 1 -mindepth 1 -type d) )

for application in "${APPLICATIONS[@]}"
do
    echo $APPLICATIONS_DIR/$application
    cd $APPLICATIONS_DIR/$application
    yarn build
done

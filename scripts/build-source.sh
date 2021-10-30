DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo $DIR

PACKAGES_DIR=$DIR/../packages
APPLICATIONS_DIR=$DIR/../packages

cd $PACKAGES_DIR

PACKAGES=( $(find . -maxdepth 1 -mindepth 1 -type d) )

yarn --silent

for package in "${PACKAGES[@]}"
do
    cd $PACKAGES_DIR/$package
    yarn build
done

cd $APPLICATIONS_DIR

APPLICATIONS=( $(find . -maxdepth 1 -mindepth 1 -type d) )

for application in "${APPLICATIONS[@]}"
do
    cd $APPLICATIONS_DIR/$application
    yarn build
done

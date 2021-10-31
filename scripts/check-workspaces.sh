trap "echo FAILED; exit 1" ERR

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

APPLICATIONS_DIR=$DIR/../applications

cd $APPLICATIONS_DIR

APPLICATIONS=( $(find . -maxdepth 1 -mindepth 1 -type d) )

for application in "${APPLICATIONS[@]}"
do
    echo
    echo ----------------------------------
    echo checking application $application
    cd $APPLICATIONS_DIR/$application
    yarn check
done


PACKAGES_DIR=$DIR/../packages

cd $PACKAGES_DIR

PACKAGES=( $(find . -maxdepth 1 -mindepth 1 -type d) )

for package in "${PACKAGES[@]}"
do
    echo
    echo ----------------------------------
    echo checking package $package
    cd $PACKAGES_DIR/$package
    yarn check
done

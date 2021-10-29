DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo $DIR

PACKAGES_DIR=$DIR/../packages

cd $PACKAGES_DIR

PACKAGES=( $(find . -maxdepth 1 -mindepth 1 -type d) )

for package in "${PACKAGES[@]}"
do
    cd $PACKAGES_DIR/$package
    yarn
    yarn build
done

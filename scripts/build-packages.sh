DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PACKAGES_DIR=$DIR/../packages

cd $PACKAGES_DIR

PACKAGES=( $(find . -maxdepth 1 -mindepth 1 -type d) )

yarn
yarn install

for package in "${PACKAGES[@]}"
do
    cd $PACKAGES_DIR/$package
    yarn build
done


git clone https://github.com/ChenPeleg/chirpy-docs.git ./jeklly-site
rm -rf ./jeklly-site/docs
echo "=== check the existance of the pages files"
ls ./jeklly-site
cp -r ./jeklly-site/. ./
echo "=== check for index.md file"
if [ -e ./docs/index.md ]
then
    echo "found index.md file"
else
    echo "This process requires at leaset an docs/index.md file"
    exit 1
fi
echo "=== copy all the site files to root dir ==="
cp -r ./docs/site/. ./
echo "=== copy docs to _tabs ==="
mv ./docs/index.md ./index.md
cp -r ./docs/. ./_tabs
cd ./docs

echo "=== copy all the md files from subdirs to docs dir ==="
find . -name \*.md -exec cp {} ./ \;
echo "=== added post dates to the docs files ==="
ls | xargs -I {} mv {} 2023-2-2-{}
cd ..
echo "=== copying the post files (with dates) to _posts ==="
cp -r ./docs/. ./_posts


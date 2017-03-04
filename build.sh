rm -rf ./docs/docs
mkdir ./docs/docs

mkdir -p ./docs/docs/3.0
daux --source=src-3.0 --destination=docs/docs/3.0

mkdir -p ./docs/docs/4.0
daux --source=src-4.0 --destination=docs/docs/4.0

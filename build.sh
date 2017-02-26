cd site-main
python -m mkdocs build
cd ..

cd site-docs-3.x
python -m mkdocs build
cd ..

cd site-docs-4.0
python -m mkdocs build
cd ..
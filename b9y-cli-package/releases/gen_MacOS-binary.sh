rm -rf dist build
cp ../b9y_cli/__main__.py b9y-cli.py
pyinstaller --onefile b9y-cli.py
mv dist/b9y-cli .

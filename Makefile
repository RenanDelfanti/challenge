coverage-run:
	@flutter test --coverage && genhtml -o coverage coverage/lcov.info && open coverage/index.html

install-lcov:
	@brew install lcov

build-web:
	@flutter build web --release --dart-define=env=prod --dart-define=apikey=${API_KEY}

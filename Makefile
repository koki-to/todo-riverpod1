# FVM := $(shell which fvm)
# FLUTTER := $(FVM) flutter

.PHONY: get-dependencies
get-dependencies:
	$(FLUTTER) pub get

.PHONY: clean
clean:
	flutter clean
	flutter pub get

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: build-runner-watch
build-runner-watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs
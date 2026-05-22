#!/usr/bin/env bash

set -e

FIREBASE_APP_ID_IOS="1:669065642915:ios:d3b23b8c2e1c96216d9016"
FIREBASE_APP_ID_ANDROID="1:669065642915:android:d0bab14ca429f0396d9016"
FIREBASE_TESTERS_GROUP="latest"
RELEASE_NOTES="Rolling release: $(date)"

function ios() {
	flutter build ipa --release --export-method development
	firebase \
		appdistribution:distribute \
		build/ios/ipa/rive_demo_app.ipa \
		--app "$FIREBASE_APP_ID_IOS" \
		--groups "$FIREBASE_TESTERS_GROUP" \
		--release-notes "$RELEASE_NOTES"
}

function android() {
    flutter build apk --release
    firebase \
        appdistribution:distribute \
        build/app/outputs/flutter-apk/app-release.apk \
		--app "$FIREBASE_APP_ID_ANDROID" \
		--groups "$FIREBASE_TESTERS_GROUP" \
		--release-notes "$RELEASE_NOTES"
}

function distribute() {
	ios
	android
}

[[ "${BASH_SOURCE[0]}" == "$0" ]] && distribute
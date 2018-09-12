CI_IOS_PATH=Tools/dev-platform-ci
SCRIPTS=./Scripts
INSTALL_SCRIPTS=./Scripts/Install-Scripts
TOOLS=./Tools
SWIFTLINT_VERSION=$(shell cat settings | grep swiftLintVersion | cut -d '"' -f2)
RUBY_VERSION=$(shell cat settings | grep rubyVersion | cut -d '"' -f2)
FASTLANE_VERSION=$(shell cat fastlane/Fastfile | grep fastlane_version | cut -d '"' -f2)

# Setup
install: install-homebrew install-rvm set-rvm install-build-tools dependencies

install-homebrew:
	@echo "Installing Homebrew"
	@sh -l ${INSTALL_SCRIPTS}/install-homebrew.sh

install-rvm: rvm-dependencies
	@echo "Installing RVM"
	@sh -l ${INSTALL_SCRIPTS}/install-rvm.sh

rvm-dependencies:
	@echo "Installing RVM Dependencies"
	@brew install homebrew/dupes/zlib || true
	@brew install autoconf automake pkg-config zlib readline libksba || true
	@brew install gnupg

set-rvm:
	@echo "Setting RVM to use Ruby-${RUBY_VERSION}"
	@sh -l ${INSTALL_SCRIPTS}/set-rvm.sh ${HOME} ${RUBY_VERSION}

install-swiftlint:
	@brew install swiftlint

install-build-tools:
	@echo "Setting up Prolific CI"
	@git rm -f ${CI_IOS_PATH} .gitmodules || true
	@rm -f .gitmodules || true
	@rm -rf ${CI_IOS_PATH} || true
	@git submodule add -f git@bitbucket.org:prolificinteractive/dev-platform-ci.git ${CI_IOS_PATH}
	@git submodule init
	@git submodule foreach git pull origin master
	@rsync -ru ${CI_IOS_PATH}/fastlane .
	@rsync -ru ${CI_IOS_PATH}/fastlane.settings .
	@echo "Installing Fastlane"
	@rvm ${RUBY_VERSION} exec gem install fastlane
	@rvm ${RUBY_VERSION} exec gem update fastlane

lint:
	@swiftlint lint --strict

autocorrect:
	@swiftlint autocorrect

documentation:
	@jazzy \
            --min-acl private \
            --no-hide-documentation-coverage \
            --theme fullwidth \
            --author "Prolific Interactive" \
            --output ../docs
	@rm -rf ./build

dependencies:
	@echo "Running Fastlane Local Setup"
	@rvm ${RUBY_VERSION} exec fastlane local_setup

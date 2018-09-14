documentation:
	@jazzy \
            --min-acl private \
            --no-hide-documentation-coverage \
            --theme fullwidth \
            --author "Prolific Interactive" \
            --output ../docs
	@rm -rf ./build

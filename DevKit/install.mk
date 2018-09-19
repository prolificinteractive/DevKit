documentation:
	@jazzy \
            --min-acl private \
            --no-hide-documentation-coverage \
            --theme fullwidth \
            --output ../docs \
            --documentation=../*.md
	@rm -rf ./build

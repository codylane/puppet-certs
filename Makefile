EXPECTED_PDK_VERSION  = $(shell jq '."pdk-version"' metadata.json)
BUNDLE_PATH           = vendor/bundle
PDK_DEBUG             = --debug


.PHONY: bundle
.PHONY: clean
.PHONY: verify


all: verify clean bundle


bundle:
	bundle config set path $(BUNDLE_PATH)
	pdk $(PDK_DEBUG) bundle install


clean:
	rm -f Gemfile.lock
	rm -rf .bundle/gems
	rm -rf vendor/*


verify:
	@echo "verify pdk version"
	[ $(shell pdk --version) == $(EXPECTED_PDK_VERSION) ]

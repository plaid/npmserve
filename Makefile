NPM = npm
XYZ = node_modules/.bin/xyz --branch master --repo git@github.com:plaid/npmserve.git


.PHONY: release-major release-minor release-patch
release-major release-minor release-patch:
	@$(XYZ) --increment $(@:release-%=%)


.PHONY: setup
setup:
	$(NPM) install

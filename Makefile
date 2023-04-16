BUILD_DIR := ./build

install: ./src/crtangle.cr 
	mkdir -p $(BUILD_DIR)
	crystal build src/crtangle.cr --no-debug --release -o $(BUILD_DIR)/crtangle

uninstall:
	rm -rf $(BUILD_DIR)

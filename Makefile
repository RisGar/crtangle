BUILD_DIR := ./build

# (Un)installation
install: $(BUILD_DIR)/crtangle

build/crtangle: src/crtangle.cr 
	mkdir -p $(BUILD_DIR)
	crystal build src/crtangle.cr --no-debug --release -o $(BUILD_DIR)/crtangle

uninstall:
	rm -rf $(BUILD_DIR)


# Testing
test: $(BUILD_DIR)/crtangle example.md
	$(BUILD_DIR)/crtangle example.md

clean:
	rm -f *.test.txt

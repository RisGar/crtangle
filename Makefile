BUILD_DIR := ./bin
SRC_DIR := ./src

SRCS := $(shell find $(SRC_DIR) -name '*.cr')

# (Un)installation
install: $(BUILD_DIR)/crtangle

$(BUILD_DIR)/crtangle: $(SRCS)
	mkdir -p $(BUILD_DIR)
	crystal build $(SRC_DIR)/crtangle.cr --no-debug --release --progress -o $(BUILD_DIR)/crtangle

uninstall:
	rm -rf $(BUILD_DIR)

# Testing
test: $(BUILD_DIR)/crtangle example.md
	$(BUILD_DIR)/crtangle example.md

clean:
	rm -f *.test.txt

# Docs
docs: $(SRCS)
	crystal docs --progress

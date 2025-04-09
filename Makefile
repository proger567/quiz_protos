# Variables
PROTO_FILE = proto/notifier/*.proto
GO_OUT_DIR = ./gen/go/
GRPC_OUT_DIR = ./gen/go/

# Targets
.PHONY: proto

proto:
	protoc -I proto $(PROTO_FILE) --go_out=$(GO_OUT_DIR) --go_opt=paths=source_relative --go-grpc_out=$(GRPC_OUT_DIR) --go-grpc_opt=paths=source_relative

.PHONY: clean
clean:
	rm -fr $(GO_OUT_DIR)*

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  proto   - Generate Go code from the protobuf file."
	@echo "  clean   - Remove generated files."
	@echo "  help    - Show this help message."


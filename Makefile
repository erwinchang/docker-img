all: build

help:
	@echo ""
	@echo "-- Help Menu"
	@echo "  1. make run         - start ubuntu  image"
	@echo "  2. make build       - build ubuntu image"
	@echo "  3. make release     - release ubuntu image"


build:
	@docker build --tag=erwinchang/u1604-hexo-build .


release:
	@docker build --tag=erwinchang/u1604-hexo-build:$(shell cat VERSION) .

.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Install dependencies from Gemfile.
	bundle install

start:  ## Start application
	bundle exec rails server

test: ## Run test
	bundle exec rspec spec/*

rubocop: ## Run rubocop
	bundle exec rubocop

rubocop-fix: ## Run rubocop with auto-fix
	bundle exec rubocop -a
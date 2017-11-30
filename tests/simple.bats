#!/usr/bin/env bats

: ${IMAGE:?}

run-in-image() {
	docker run --rm --net=none -it "${IMAGE:?}" "$@"
}

@test "salt --version" {
	result=$(run-in-image "salt" --version)
	printf "result: %s" "$result"
	[[ "${result}" =~ ^(salt|salt-[^\s]+)\ ([0-9]+\.[0-9]+\.[0-9]+)\ \(([A-Za-z]+)\) ]]
}

@test "salt-minion --version" {
	result=$(run-in-image "salt-minion" --version)
	printf "result: %s" "$result"
	[[ "${result}" =~ ^(salt|salt-[^\s]+)\ ([0-9]+\.[0-9]+\.[0-9]+)\ \(([A-Za-z]+)\) ]]
}

@test "salt-api --version" {
	result=$(run-in-image "salt-api" --version)
	printf "result: %s" "$result"
	[[ "${result}" =~ ^(salt|salt-[^\s]+)\ ([0-9]+\.[0-9]+\.[0-9]+)\ \(([A-Za-z]+)\) ]]
}

@test "salt-cloud --version" {
	result=$(run-in-image "salt-cloud" --version)
	printf "result: %s" "$result"
	[[ "${result}" =~ ^(salt|salt-[^\s]+)\ ([0-9]+\.[0-9]+\.[0-9]+)\ \(([A-Za-z]+)\) ]]
}


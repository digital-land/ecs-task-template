
.PHONY: \
	compile \
	init \
	run-task \
	test \
	test-unit \
	test-acceptance

compile ::
	python -m piptools compile --output-file=requirements/requirements.txt requirements/requirements.in
	python -m piptools compile --output-file=requirements/test-requirements.txt requirements/test-requirements.in

init ::
	pip install --upgrade pip
	pip install -r requirements/test-requirements.txt

run-task ::
	cd task; \
	./run.sh;

test: test-unit test-acceptance

test-unit:
	python -m pytest tests/unit

test-acceptance:
	# run  bats test of the script
	bats tests/acceptance/test_run.bats

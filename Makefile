all: install format lint test

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:	
	black . --line-length 100 --verbose

lint:
	ruff check . --fix --verbose

test:
	python -m pytest -vv .

etl:
	python main.py extract 
	python main.py load
	python main.py query --query-name query1
	python main.py query --query-name query2
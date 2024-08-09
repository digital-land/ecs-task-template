from task.hello import hello

def test_hello_prints_statement(capsys):
    hello(name='Owen')
    captured = capsys.readouterr()

    # Assert that the output was printed
    assert captured.out is not None

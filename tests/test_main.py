from heiwa4126_hello_python.main import hello


def test_hello_custom_msg(capsys):
    hello("GitHub Copilot")
    captured = capsys.readouterr()
    assert captured.out == "Hello GitHub Copilot\n"


def test_hello_default_msg(capsys):
    hello()
    captured = capsys.readouterr()
    assert captured.out == "Hello Python\n"

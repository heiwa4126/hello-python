import cowsay


def hello(msg="Python") -> None:
    """
    greeting message
    """
    cowsay.cow(f"Hello {msg}")

import click

def hello(name):
    print(f'hello {name}')

@click.command()
@click.option(
    "--name",
    type=str,
    help="Name to print to the console",
)
def hello_command(name):
    hello(name)
    

if __name__ == "__main__":
    hello_command()
import click

@click.group()
def cli():
    pass

@click.command()
def hello():
    click.echo('Hello, World !!')

@click.command()
@click.argument('name')
def greeting(name):
    click.echo('Hello %s !' % name)

cli.add_command(hello)
cli.add_command(greeting)

if __name__ == '__main__':
    cli()

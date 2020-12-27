require_relative './lib/cli.rb'

cli = Translate::Cli.new(ARGV)
cli.start_translate
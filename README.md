# AppElixir and AppRuby

```shell
cd app_elixir
mix deps.get
mix run --no-halt
#localhost:4000

cd app_ruby
bundle install
bundle exec rackup -s puma -p 3000
#localhost:3000

#run two app

bundle exec foreman start

```

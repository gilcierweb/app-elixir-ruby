defmodule AppElixir.Router do
  use Plug.Router

  plug(:match)
  plug(
    Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Poison
  )
  plug(:dispatch)

  def child_spec(_opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  get "/" do
    page = EEx.eval_file("web/templates/index.html.eex", [name: 'gilcierweb oliviera de sousa asdfasdkfçkasçdfkasçdfkasdf sdfsdf'])
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, page)
    |> halt
  end

#  get "/" do
#    #    url = "https://anapioficeandfire.com/api/characters"
#    url = "https://api.github.com/users/gilcierweb"
#    # url = api_route(id_or_name)
#    {:ok, response} = HTTPoison.get(url, [], [])
#    IO.inspect(response.body)
#    send_resp(conn, 200, response.body)
#  end

  get "/search" do
    url = "https://api.github.com/users/gilcierweb/repos"
    {:ok, response} = HTTPoison.get(url, [], [])
    send_resp(conn, 200, response.body)
  end

  get "/show/:id" do
    url = "https://api.github.com/users/gilcierweb/repos"
    {:ok, response} = HTTPoison.get(url, [], [])
    send_resp(conn, 200, response.body)
  end

  get "/gilcierweb" do
    #    GET /users/:username/repos
    url = "https://api.github.com/users/gilcierweb/repos"
    {:ok, response} = HTTPoison.get(url, [], [])
    #    IO.inspect(response.body)
    send_resp(conn, 200, response.body)
  end

  get "/json/:name" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{name: name}))
  end

  post "/about/:name" do
    send_resp(conn, 200, "#{name} was added to our database of names.")
  end

  patch "/about/:name" do
    send_resp(conn, 200, "#{name} was updated in our database of names.")
  end

  put "/about/:name/promote" do
    send_resp(conn, 200, "#{name} was promoted.")
  end

  delete "/about/:name" do
    send_resp(conn, 200, "#{name} was deleted from database of names.")
  end

  match _ do
    conn
    |> send_resp(404, "Not found")
  end

end
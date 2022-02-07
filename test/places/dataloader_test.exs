defmodule ElixirPlayground.DataloaderTest do
  alias ElixirPlayground.{Places, Place, Repo}
  use ElixirPlayground.RepoCase

  test "using dataloader" do
    id_rome = Map.get(Places.add("Roma"), :id)
    id_tokyo = Map.get(Places.add("Tokyo"), :id)
    id_ba = Map.get(Places.add("Buenos Aires"), :id)

    source = Dataloader.Ecto.new(Repo)
    loader = Dataloader.new() |> Dataloader.add_source(:db, source)

    loader =
      loader
      |> Dataloader.load(:db, Place, id_rome)
      |> Dataloader.load_many(:db, Place, [id_tokyo, id_ba])

    # Things are loaded (not retrieved) here
    loader = Dataloader.run(loader)

    # Actual retrieval
    places = Dataloader.get_many(loader, :db, Place, [id_rome, id_ba])

    assert length(places) == 2

    # TODO(gianluca): should find a way to show that the number of queries done to DB is one.
  end
end

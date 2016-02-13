ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Whistlio.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Whistlio.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Whistlio.Repo)


defmodule Whistlio.Crypto do

  import UUID

  def uuid(), do: uuid(nil, false)
  def uuid(bin) when is_boolean(bin), do: uuid(nil, bin)

  def uuid(name, bin \\ false) do
    # Is this strong enough to effectively prevent file name collisions?

    case bin do
      false -> UUID.uuid4(:strong, :default)
      true ->
        UUID.uuid4(:strong, :default)
        |> UUID.string_to_binary
    end
  end
end

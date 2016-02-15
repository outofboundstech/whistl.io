defmodule Whistlio.Crypto do

  import UUID

  def uuid(name \\ nil) do
    # Is this strong enough to effectively prevent file name collisions?
    UUID.uuid4(:strong, :default)
  end
end

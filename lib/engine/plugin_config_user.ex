defmodule Engine.PluginConfigUser do
  @moduledoc """
  Provides struct and type for a PluginConfigUser
  """

  @type t :: %__MODULE__{GID: integer | nil, UID: integer | nil}

  defstruct [:GID, :UID]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [GID: :integer, UID: :integer]
  end
end

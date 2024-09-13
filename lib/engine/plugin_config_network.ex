defmodule Engine.PluginConfigNetwork do
  @moduledoc """
  Provides struct and type for a PluginConfigNetwork
  """

  @type t :: %__MODULE__{Type: String.t()}

  defstruct [:Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Type: {:string, :generic}]
  end
end

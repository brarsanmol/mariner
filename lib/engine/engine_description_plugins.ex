defmodule Engine.EngineDescriptionPlugins do
  @moduledoc """
  Provides struct and type for a EngineDescriptionPlugins
  """

  @type t :: %__MODULE__{Name: String.t() | nil, Type: String.t() | nil}

  defstruct [:Name, :Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Name: {:string, :generic}, Type: {:string, :generic}]
  end
end

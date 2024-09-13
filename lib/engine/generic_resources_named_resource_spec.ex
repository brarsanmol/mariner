defmodule Engine.GenericResourcesNamedResourceSpec do
  @moduledoc """
  Provides struct and type for a GenericResourcesNamedResourceSpec
  """

  @type t :: %__MODULE__{Kind: String.t() | nil, Value: String.t() | nil}

  defstruct [:Kind, :Value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Kind: {:string, :generic}, Value: {:string, :generic}]
  end
end

defmodule Engine.GenericResourcesDiscreteResourceSpec do
  @moduledoc """
  Provides struct and type for a GenericResourcesDiscreteResourceSpec
  """

  @type t :: %__MODULE__{Kind: String.t() | nil, Value: integer | nil}

  defstruct [:Kind, :Value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Kind: {:string, :generic}, Value: :integer]
  end
end

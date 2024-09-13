defmodule Engine.Driver do
  @moduledoc """
  Provides struct and type for a Driver
  """

  @type t :: %__MODULE__{Name: String.t(), Options: Engine.DriverOptions.t() | nil}

  defstruct [:Name, :Options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Name: {:string, :generic}, Options: {Engine.DriverOptions, :t}]
  end
end

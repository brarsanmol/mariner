defmodule Engine.DriverData do
  @moduledoc """
  Provides struct and type for a DriverData
  """

  @type t :: %__MODULE__{Data: Engine.DriverDataData.t(), Name: String.t()}

  defstruct [:Data, :Name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Data: {Engine.DriverDataData, :t}, Name: {:string, :generic}]
  end
end

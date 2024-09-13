defmodule Engine.SystemVersionComponents do
  @moduledoc """
  Provides struct and type for a SystemVersionComponents
  """

  @type t :: %__MODULE__{Details: map | nil, Name: String.t(), Version: String.t()}

  defstruct [:Details, :Name, :Version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Details: :map, Name: {:string, :generic}, Version: {:string, :generic}]
  end
end

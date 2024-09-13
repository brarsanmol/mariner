defmodule Engine.ContainerCreateResponse do
  @moduledoc """
  Provides struct and type for a ContainerCreateResponse
  """

  @type t :: %__MODULE__{Id: String.t(), Warnings: [String.t()]}

  defstruct [:Id, :Warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Id: {:string, :generic}, Warnings: [string: :generic]]
  end
end

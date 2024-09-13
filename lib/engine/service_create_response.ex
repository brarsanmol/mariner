defmodule Engine.ServiceCreateResponse do
  @moduledoc """
  Provides struct and type for a ServiceCreateResponse
  """

  @type t :: %__MODULE__{ID: String.t() | nil, Warnings: [String.t()] | nil}

  defstruct [:ID, :Warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ID: {:string, :generic}, Warnings: [string: :generic]]
  end
end

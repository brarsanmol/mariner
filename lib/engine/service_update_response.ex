defmodule Engine.ServiceUpdateResponse do
  @moduledoc """
  Provides struct and type for a ServiceUpdateResponse
  """

  @type t :: %__MODULE__{Warnings: [String.t()] | nil}

  defstruct [:Warnings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Warnings: [string: :generic]]
  end
end

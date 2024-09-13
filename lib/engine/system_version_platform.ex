defmodule Engine.SystemVersionPlatform do
  @moduledoc """
  Provides struct and type for a SystemVersionPlatform
  """

  @type t :: %__MODULE__{Name: String.t()}

  defstruct [:Name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Name: {:string, :generic}]
  end
end

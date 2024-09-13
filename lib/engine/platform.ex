defmodule Engine.Platform do
  @moduledoc """
  Provides struct and type for a Platform
  """

  @type t :: %__MODULE__{Architecture: String.t() | nil, OS: String.t() | nil}

  defstruct [:Architecture, :OS]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Architecture: {:string, :generic}, OS: {:string, :generic}]
  end
end

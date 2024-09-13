defmodule Engine.Limit do
  @moduledoc """
  Provides struct and type for a Limit
  """

  @type t :: %__MODULE__{MemoryBytes: integer | nil, NanoCPUs: integer | nil, Pids: integer | nil}

  defstruct [:MemoryBytes, :NanoCPUs, :Pids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [MemoryBytes: :integer, NanoCPUs: :integer, Pids: :integer]
  end
end

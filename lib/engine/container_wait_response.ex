defmodule Engine.ContainerWaitResponse do
  @moduledoc """
  Provides struct and type for a ContainerWaitResponse
  """

  @type t :: %__MODULE__{Error: Engine.ContainerWaitExitError.t() | nil, StatusCode: integer}

  defstruct [:Error, :StatusCode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [Error: {Engine.ContainerWaitExitError, :t}, StatusCode: :integer]
  end
end

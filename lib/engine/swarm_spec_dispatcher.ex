defmodule Engine.SwarmSpecDispatcher do
  @moduledoc """
  Provides struct and type for a SwarmSpecDispatcher
  """

  @type t :: %__MODULE__{HeartbeatPeriod: integer | nil}

  defstruct [:HeartbeatPeriod]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [HeartbeatPeriod: :integer]
  end
end

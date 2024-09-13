defmodule Engine.SwarmSpecTaskDefaults do
  @moduledoc """
  Provides struct and type for a SwarmSpecTaskDefaults
  """

  @type t :: %__MODULE__{LogDriver: Engine.SwarmSpecTaskDefaultsLogDriver.t() | nil}

  defstruct [:LogDriver]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [LogDriver: {Engine.SwarmSpecTaskDefaultsLogDriver, :t}]
  end
end

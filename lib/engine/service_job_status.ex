defmodule Engine.ServiceJobStatus do
  @moduledoc """
  Provides struct and type for a ServiceJobStatus
  """

  @type t :: %__MODULE__{
          JobIteration: Engine.ObjectVersion.t() | nil,
          LastExecution: String.t() | nil
        }

  defstruct [:JobIteration, :LastExecution]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [JobIteration: {Engine.ObjectVersion, :t}, LastExecution: {:string, :generic}]
  end
end

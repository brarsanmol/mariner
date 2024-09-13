defmodule Engine.ServiceUpdateStatus do
  @moduledoc """
  Provides struct and type for a ServiceUpdateStatus
  """

  @type t :: %__MODULE__{
          CompletedAt: String.t() | nil,
          Message: String.t() | nil,
          StartedAt: String.t() | nil,
          State: String.t() | nil
        }

  defstruct [:CompletedAt, :Message, :StartedAt, :State]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      CompletedAt: {:string, :generic},
      Message: {:string, :generic},
      StartedAt: {:string, :generic},
      State: {:enum, ["updating", "paused", "completed"]}
    ]
  end
end

defmodule Engine.NodeStatus do
  @moduledoc """
  Provides struct and type for a NodeStatus
  """

  @type t :: %__MODULE__{
          Addr: String.t() | nil,
          Message: String.t() | nil,
          State: String.t() | nil
        }

  defstruct [:Addr, :Message, :State]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Addr: {:string, :generic},
      Message: {:string, :generic},
      State: {:enum, ["unknown", "down", "ready", "disconnected"]}
    ]
  end
end

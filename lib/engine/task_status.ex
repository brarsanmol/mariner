defmodule Engine.TaskStatus do
  @moduledoc """
  Provides struct and type for a TaskStatus
  """

  @type t :: %__MODULE__{
          ContainerStatus: Engine.ContainerStatus.t() | nil,
          Err: String.t() | nil,
          Message: String.t() | nil,
          PortStatus: Engine.PortStatus.t() | nil,
          State: String.t() | nil,
          Timestamp: String.t() | nil
        }

  defstruct [:ContainerStatus, :Err, :Message, :PortStatus, :State, :Timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ContainerStatus: {Engine.ContainerStatus, :t},
      Err: {:string, :generic},
      Message: {:string, :generic},
      PortStatus: {Engine.PortStatus, :t},
      State:
        {:enum,
         [
           "new",
           "allocated",
           "pending",
           "assigned",
           "accepted",
           "preparing",
           "ready",
           "starting",
           "running",
           "complete",
           "shutdown",
           "failed",
           "rejected",
           "remove",
           "orphaned"
         ]},
      Timestamp: {:string, :generic}
    ]
  end
end

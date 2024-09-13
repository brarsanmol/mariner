defmodule Engine.EventMessage do
  @moduledoc """
  Provides struct and type for a EventMessage
  """

  @type t :: %__MODULE__{
          Action: String.t() | nil,
          Actor: Engine.EventActor.t() | nil,
          Type: String.t() | nil,
          scope: String.t() | nil,
          time: integer | nil,
          timeNano: integer | nil
        }

  defstruct [:Action, :Actor, :Type, :scope, :time, :timeNano]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Action: {:string, :generic},
      Actor: {Engine.EventActor, :t},
      Type:
        {:enum,
         [
           "builder",
           "config",
           "container",
           "daemon",
           "image",
           "network",
           "node",
           "plugin",
           "secret",
           "service",
           "volume"
         ]},
      scope: {:enum, ["local", "swarm"]},
      time: :integer,
      timeNano: :integer
    ]
  end
end

defmodule Engine.MountPoint do
  @moduledoc """
  Provides struct and type for a MountPoint
  """

  @type t :: %__MODULE__{
          Destination: String.t() | nil,
          Driver: String.t() | nil,
          Mode: String.t() | nil,
          Name: String.t() | nil,
          Propagation: String.t() | nil,
          RW: boolean | nil,
          Source: String.t() | nil,
          Type: String.t() | nil
        }

  defstruct [:Destination, :Driver, :Mode, :Name, :Propagation, :RW, :Source, :Type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      Destination: {:string, :generic},
      Driver: {:string, :generic},
      Mode: {:string, :generic},
      Name: {:string, :generic},
      Propagation: {:string, :generic},
      RW: :boolean,
      Source: {:string, :generic},
      Type: {:enum, ["bind", "volume", "tmpfs", "npipe", "cluster"]}
    ]
  end
end
